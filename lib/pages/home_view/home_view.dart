// import 'package:flutter/cupertino.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nostr_app/pages/widgets/centered_circular_progess_indicator.dart';
import 'package:nostr_app/pages/widgets/domain_card.dart';
import 'package:nostr_app/pages/widgets/domain_models.dart';
import 'package:nostr_app/pages/widgets/time_ago.dart';
import 'package:nostr_tools/nostr_tools.dart';

/// uses https://makers.bolt.fun/story/nostr-tools-flutter-tutorial-building-a-simple-feed-for-noost-app-part-1--766

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  /// hold the status of our relay connection
  bool _isConnected = false;

  /// creates an instance of RelayApi, which is defined in nostr_tools. It requires the relay URL as an argument
  final _relay = RelayApi(relayUrl: 'wss://relay.damus.io');

  /// a list that will hold all the events that we'll get from the relay after subscribing
  final List<Event> _events = [];

  /// a map that will hold the mapping of the public key with the user metadata
  final Map<String, Metadata> _metaDatas = {};

  Stream get relayStream async* {
    // TODO: Establish a connection to the relay
    final stream = await _relay.connect();
    // TODO: Set up an event listener for relay events
    _relay.on((event) {
      if (event == RelayEvent.connect) {
        setState(() => _isConnected = true);
      } else if (event == RelayEvent.error) {
        setState(() => _isConnected = false);
      }
    });
    // TODO: Subscribe to the relay to receive events with a specific filter
    _relay.sub([
      Filter(
        kinds: [1],
        limit: 100,
        t: ["nostr"],
      )
    ]);

    // TODO: Listen for incoming events from the relay and handle them appropriately

    // 1
    await for (var message in stream) {
      // 2
      if (message.type == 'EVENT') {
        // 3
        Event event = message.message;

        // 4
        if (event.kind == 1) {
          _events.add(event);
          _relay.sub([
            Filter(kinds: [0], authors: [event.pubkey])
          ]);
          // 5
        } else if (event.kind == 0) {
          Metadata metadata = Metadata.fromJson(jsonDecode(event.content));
          _metaDatas[event.pubkey] = metadata;
        }
      }
      // 6
      yield message;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1
      body: StreamBuilder(
        // 2
        stream: relayStream,
        // 3
        builder: (context, snapshot) {
          // 4
          if (snapshot.hasData) {
            return ListView.builder(
              // 5
              itemCount: _events.length,
              itemBuilder: (context, index) {
                final event = _events[index];
                final metadata = _metaDatas[event.pubkey];
                // 6
                final dModels = DomainModels(
                  noteId: event.id,
                  avatarUrl: metadata?.picture ??
                      'https://robohash.org/${event.pubkey}',
                  name: metadata?.name ?? 'Anon',
                  username: metadata?.displayName ??
                      (metadata?.display_name ?? 'Anon'),
                  time: TimeAgo.format(event.created_at),
                  content: event.content,
                  pubkey: event.pubkey,
                );
                // 7
                return DomainCard(dmodel: dModels);
              },
            );
            // 8
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: Text('Loading....'));
            // 9
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          // 10
          return const CenteredCircularProgressIndicator();
        },
      ),
    );
  }
}
