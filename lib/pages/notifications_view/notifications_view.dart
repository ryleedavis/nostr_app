import 'package:flutter/material.dart';

class NotificationsView extends StatefulWidget {
  // const ProfileView({super.key})
  @override
  State<NotificationsView> createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Notifications View",
              style: TextStyle(
                fontSize: 26,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
