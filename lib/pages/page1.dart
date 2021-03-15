import 'package:flutter/material.dart';
import 'package:transportation2/components/navigation_bar.dart';
import 'package:transportation2/config/theme.dart';
import 'package:transportation2/entity/firebase_user.dart';

class Page1 extends StatefulWidget {

  final int currentTab;
  final CustomFirebaseUser firebaseUser;

  Page1({this.currentTab, this.firebaseUser});

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {

    double heightAppBar= screenHeight(context,dividedBy: 10);

    return Scaffold(
      appBar: AppBar(
        title: Text("Page1"),
      ),
      bottomNavigationBar: SizedBox(
        height: heightAppBar,
        child: GradientBottomNavBar(
          currentTab: widget.currentTab,
          heightBar: heightAppBar,
          firebaseUser: widget.firebaseUser,
        ),
      ),
      body: Text("Page1"),
    );
  }
}
