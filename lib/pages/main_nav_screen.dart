import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nostr_app/pages/home_view/home_view.dart';
import 'package:nostr_app/pages/notifications_view/notifications_view.dart';
import 'package:nostr_app/pages/profile_view/profile_view.dart';
import 'package:nostr_app/theme/nostr_colors.dart';
import 'package:nostr_app/utilities/assets.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedTap = 0;

  void onSelectedtap(int index) {
    if (_selectedTap == index) return;
    setState(() {
      _selectedTap = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 25,
            ),
            Text("Drifter"),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(),
            child: IconButton(
              icon: SvgPicture.asset(
                Assets.svg.gear,
                color: Colors.white,
              ),
              onPressed: () {
                // open to a settings menu
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTap,
        // backgroundColor: NostrColors.backgroundAppBar,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.svg.bell,
              color: (_selectedTap == 1) ? Colors.deepPurple : Colors.black45,
              height: 20,
            ),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: onSelectedtap,
        selectedItemColor: NostrColors.backgroundAppBar,
      ),
      body: IndexedStack(
        index: _selectedTap,
        children: [
          HomeView(),
          NotificationsView(),
          ProfileView(),
        ],
      ),
    );
  }
}
