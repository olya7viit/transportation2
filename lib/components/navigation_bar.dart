import 'package:flutter/material.dart';
import 'package:gradient_bottom_navigation_bar/gradient_bottom_navigation_bar.dart';
import 'package:motion_tab_bar/motiontabbar.dart';
import 'package:transportation2/config/theme.dart';
import 'package:transportation2/entity/firebase_user.dart';
import 'package:transportation2/pages/home.dart';
import 'package:transportation2/pages/page1.dart';
import 'package:transportation2/pages/page2.dart';
import 'package:transportation2/pages/timer_page.dart';
import 'package:transportation2/pages/profile_page.dart';

class GradientBottomNavBar extends StatefulWidget {
  final CustomFirebaseUser firebaseUser;
  var currentTab = 0;
  final heightBar;

  GradientBottomNavBar({
    @required this.currentTab,
    this.heightBar,
    this.firebaseUser
  });

  @override
  _GradientBottomNavBarState createState() => _GradientBottomNavBarState();
}

class _GradientBottomNavBarState extends State<GradientBottomNavBar> {

  void _onTap(int index) async {
    if (index == widget.currentTab) {
      return;
    }

    widget.currentTab = index;

    if (index == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Home(
            currentTab: index,
            firebaseUser: widget.firebaseUser,
          ),
        ),
      );
    } else if (index == 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Page1(
            currentTab: index,
            firebaseUser: widget.firebaseUser,
          ),
        ),
      );
    } else if (index == 2) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Page2(
            currentTab: index,
            firebaseUser: widget.firebaseUser,
          ),
        ),
      );
    } else if (index == 3) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Timer(
            currentTab: index,
            firebaseUser: widget.firebaseUser,
          ),
        ),
      );
    }
    else if (index == 4) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Profile(
            currentTab: index,
            firebaseUser: widget.firebaseUser,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    TextStyle style = TextStyle(fontSize: widget.heightBar * 0.18);

    // return GradientBottomNavigationBar(
    //   backgroundColorStart: AppColors.blue,
    //   backgroundColorEnd: AppColors.blue,
    //   type: BottomNavigationBarType.fixed,
    //   fixedColor: AppColors.white,
    //   iconSize: widget.heightBar * 0.35,
    //   items: [
    //     BottomNavigationBarItem(
    //       activeIcon: Icon(Icons.home),
    //       icon: Icon(Icons.home, ),
    //       title: Text("Home", style: style),
    //     ),
    //     BottomNavigationBarItem(
    //       activeIcon: Icon(Icons.car_repair),
    //       icon:
    //       Icon(Icons.car_repair, ),
    //       title: Text("Page1", style: style),
    //     ),
    //     BottomNavigationBarItem(
    //       activeIcon: Icon(Icons.car_repair),
    //       icon:
    //       Icon(Icons.car_repair, ),
    //       title: Text("Page2", style: style),
    //     ),
    //     BottomNavigationBarItem(
    //       activeIcon: Icon(Icons.timer),
    //       icon: Icon(Icons.timer,),
    //       title: Text("Timer", style: style),
    //     ),
    //     BottomNavigationBarItem(
    //       activeIcon: Icon(Icons.person),
    //       icon: Icon(Icons.person,),
    //       title: Text("Profile", style: style),
    //     ),
    //   ],
    //   currentIndex: widget.currentTab,
    //   onTap: _onTap,
    // );

    return MotionTabBar(
      labels: [
        "Home", "Page1", "Page2", "Timer", "Profile",
      ],
      initialSelectedTab: getInitialSelectedTab(widget.currentTab),
      tabIconColor: AppColors.blue,
      tabSelectedColor: AppColors.blue,
      onTabItemSelected: (int value){
        _onTap(value);
      },
      icons: [
        Icons.home,Icons.car_repair,Icons.car_repair,Icons.timer, Icons.person
      ],
      textStyle: TextStyle(color: AppColors.blue),
    );
  }

  String getInitialSelectedTab(currentTab) {
    return currentTab == 0 ? "Home"
        : currentTab == 1 ? "Page1"
        : currentTab == 2 ? "Page2"
        : currentTab == 3 ? "Timer"
        :  "Profile";
  }
}
