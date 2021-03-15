import 'package:flutter/material.dart';
import 'package:transportation2/components/navigation_bar.dart';
import 'package:transportation2/config/theme.dart';
import 'package:transportation2/entity/firebase_user.dart';

class Page2 extends StatefulWidget {

  final int currentTab;
  final CustomFirebaseUser firebaseUser;

  Page2({this.currentTab, this.firebaseUser});

  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    double heightAppBar= screenHeight(context,dividedBy: 10);

    return Scaffold(
      appBar: AppBar(
        title: Text("Page2"),
      ),
      bottomNavigationBar: SizedBox(
        height: heightAppBar,
        child: GradientBottomNavBar(
          currentTab: widget.currentTab,
          heightBar: heightAppBar,
          firebaseUser: widget.firebaseUser,
        ),
      ),
      body: Text("Page2"),
    );
  }
}
