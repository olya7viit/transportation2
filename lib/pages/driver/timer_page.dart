import 'package:flutter/material.dart';
import 'package:transportation2/components/custom_button.dart';
import 'package:transportation2/components/stop_watch_timer .dart';
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
    double screen_height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("Timer"),
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: SizedBox(
        height: heightAppBar,
        child: GradientBottomNavBar(
          currentTab: widget.currentTab,
          heightBar: heightAppBar,
          firebaseUser: widget.firebaseUser,
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(screen_height * 0.015),
            child: Text(
              "Отслеживание сна помогает сформировать наиболее полезный график сна и отдыха, избавиться от бессонницы и проблем, которые она способна принести в вашу жизнь!",
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: screen_height * 0.025,
              ),
            ),
          ),
          SizedBox(height: screen_height * 0.01,),
          CustomStopWatchTimer(),
        ],
      )
    );
  }

}
