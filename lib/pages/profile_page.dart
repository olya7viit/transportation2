import 'package:flutter/material.dart';
import 'package:transportation2/components/navigation_bar.dart';
import 'package:transportation2/config/theme.dart';
import 'package:transportation2/entity/firebase_user.dart';

class Profile extends StatefulWidget {

  final int currentTab;
  final CustomFirebaseUser firebaseUser;

  Profile({this.currentTab, this.firebaseUser});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    double heightAppBar= screenHeight(context,dividedBy: 10);

    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      bottomNavigationBar: SizedBox(
        height: heightAppBar,
        child: GradientBottomNavBar(
          currentTab: widget.currentTab,
          heightBar: heightAppBar,
          firebaseUser: widget.firebaseUser,
        ),
      ),
      body: Text("Page4"),
    );
  }
}
