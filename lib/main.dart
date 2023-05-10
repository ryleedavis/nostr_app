// import 'package:nostr_app/theme/app_colors.dart';
// import 'package:nostr_app/widgets/main_screen/main_screen_widget.dart';
import 'package:flutter/material.dart';
import 'package:nostr_app/pages/main_nav_screen.dart';
import 'package:nostr_app/theme/nostr_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Nostr App: Driftr',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: NostrColors.backgroundAppBar,
        ),
      ),
      home: HomeScreen(),
    );
  }
}
