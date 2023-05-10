import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  // const ProfileView({super.key})
  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Profile View",
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
