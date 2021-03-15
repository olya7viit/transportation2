import 'package:flutter/material.dart';
import 'package:transportation2/components/navigation_bar.dart';
import 'package:transportation2/config/theme.dart';
import 'package:transportation2/entity/firebase_user.dart';

class Timer extends StatefulWidget {

  final int currentTab;
  final CustomFirebaseUser firebaseUser;

  Timer({this.currentTab, this.firebaseUser});

  @override
  _TimerState createState() => _TimerState();
}

class _TimerState extends State<Timer> {
  @override
  Widget build(BuildContext context) {
    double heightAppBar= screenHeight(context,dividedBy: 10);

    return Scaffold(
      appBar: AppBar(
        title: Text("Timer"),
      ),
      bottomNavigationBar: SizedBox(
        height: heightAppBar,
        child: GradientBottomNavBar(
          currentTab: widget.currentTab,
          heightBar: heightAppBar,
          firebaseUser: widget.firebaseUser,
        ),
      ),
      body: Text("Timer"),
    );
  }
}
