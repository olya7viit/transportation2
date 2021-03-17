import 'package:flutter/material.dart';
import 'package:motion_tab_bar/motiontabbar.dart';
import 'package:transportation2/config/theme.dart';
import 'package:transportation2/entity/firebase_user.dart';
import 'package:transportation2/entity/role.dart';
import 'package:transportation2/pages/driver/gps_page.dart';
import 'package:transportation2/pages/driver/home.dart';
import 'file:///C:/Users/Lenovo/AndroidStudioProjects/transportation2/lib/pages/driver/profile_page.dart';
import 'package:transportation2/pages/driver/statistic.dart';
import 'package:transportation2/pages/driver/timer_page.dart';

class GradientBottomNavBar extends StatefulWidget {
  final CustomFirebaseUser firebaseUser;
  var currentTab = 0;
  final heightBar;

  GradientBottomNavBar({
    @required this.currentTab,
    @required this.heightBar,
    @required this.firebaseUser
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
          builder: (context) => ProfileDriver(
            currentTab: index,
            firebaseUser: widget.firebaseUser,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    var labelsDriver = ["Home", "GPS", "Statistic", "Timer", "Profile"];
    var labelsUser = ["Home", "GPS", "Step Counter", "Statistic", "Profile"];
    var iconsDriver = [Icons.home, Icons.location_on,Icons.insert_chart, Icons.timer, Icons.person];
    var iconsUser = [Icons.home, Icons.location_on, Icons.directions_walk, Icons.insert_chart, Icons.person];

    return MotionTabBar(
      labels: widget.firebaseUser.role == Role.user
        ? labelsUser
        : labelsDriver,
      initialSelectedTab: widget.firebaseUser.role == Role.user
          ? getInitialSelectedTabUser(widget.currentTab)
          : getInitialSelectedTabDriver(widget.currentTab),
      tabIconColor: AppColors.blue,
      tabSelectedColor: AppColors.blue,
      onTabItemSelected: (int value){
        _onTap(value);
      },
      icons: widget.firebaseUser.role == Role.user
          ? iconsUser
          : iconsDriver,
      textStyle: TextStyle(color: AppColors.blue),
    );
  }

  String getInitialSelectedTabUser(currentTab) {
    return currentTab == 0 ? "Home"
        : currentTab == 1 ? "GPS"
        : currentTab == 2 ? "Step Counter"
        : currentTab == 3 ? "Statistic"
        :  "Profile";
  }

  String getInitialSelectedTabDriver(currentTab) {
    return currentTab == 0 ? "Home"
        : currentTab == 1 ? "GPS"
        : currentTab == 2 ? "Statistic"
        : currentTab == 3 ? "Timer"
        :  "Profile";
  }
}
