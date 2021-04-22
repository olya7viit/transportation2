import 'package:flutter/material.dart';

class AppColors{
  static const blue = Colors.blue;
  static Color lightBlue = Colors.blue[200];
  static const white = Colors.white;
  static const dart = Colors.black12;
  static const black = Colors.black;
  static const whiteDirty = Color(0xFFF5F7F8);
  static const main = Color(0xFF022259);
  static const lightGray = Color(0xFFCFD0D1);
  static const red = Color(0xFFD51010);
  static const background = white;
  static const backgroundLight = Color(0xFF383c4d);
  static const backgroundDark = Color(0xFF323645);
  static const gray = Color(0xFF53586D);
  static const darkGray = Color(0xFF707070);
  static const green = Color(0xFF469B1F);
  static const yellow = Color(0xFFFFD705);
  static const orange = Color(0xFFFF8E25);
  static const purple = Color.fromRGBO(144, 93, 161, 1);
  static const white3 = Color.fromRGBO(255, 255, 255, 0.03);
  static const white10 = Colors.white10;
  static const white24 = Colors.white24;
  static const white40 = Color.fromRGBO(255, 255, 255, 0.4);
  static const white60 = Colors.white60;
  static const white80 = Color.fromRGBO(255, 255, 255, 0.8);
  static const transparent = Color(0x00000000);
  static const success = Color(0xFF2AA952);
  static const backgroundTop = Color.fromRGBO(42, 45, 52, 0.73);
  static const backgroundBottom = Color.fromRGBO(44, 39, 61, 0.87);
  static const backgroundGradient = LinearGradient(
      colors: [backgroundTop, backgroundBottom],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter);
}

Size screenSize(BuildContext context) {
  return MediaQuery.of(context).size;
}

double screenHeight(BuildContext context,
    {double dividedBy = 1, double reducedBy = 0.0}) {
  return (screenSize(context).height) / dividedBy;
}

double screenWidth(BuildContext context,
    {double dividedBy = 1, double reducedBy = 0.0}) {
  return (screenSize(context).width) / dividedBy;
}
class AppPadding {
  static const EdgeInsets side = EdgeInsets.symmetric(horizontal: 20);
  static const EdgeInsets side_button = EdgeInsets.symmetric(horizontal: 40);
}

class AppSizes {
  static const appBar = 56.0;
  static const tabBar = 48.0;
  static const line = 60.0;
  static const lineSort = 40.0;
  static const button = 48.0;
  static const smallButton = 42.0;
  static const iconButton = 45.0;
  static const indent = 10.0;
  static const indentVerySmall = 2.0;
  static const indentSmall = 5.0;
  static const indentLarge = 15.0;
  static const indentVeryLarge = 25.0;
  static const statusIcon = 32.0;
  static const settingsIcon = 32.0;
  static const systemsIcon = 25.0;
  static const icon = 15.0;
  static const sideIndentSmall = 12.0;
  static const sideIndentLarge = 20.0;
  static const cursorWidth = 1.2;
  static const lineWidth = 1.4;
  static const separatorHeight = 1.8;
  static const borderRadius = 15.0;
  static const indicatorThickness = 4.0;
  static const int splashScreenTitleFontSize = 48;
  static const int titleFontSize = 34;
  static const double widgetSidePadding = 20;
  static const double buttonRadius = 25;
  static const double imageRadius = 8;
  static const double linePadding = 4;
  static const double widgetBorderRadius = 34;
  static const double textFieldRadius = 4.0;
  static const app_bar_size = 56.0;
  static const app_bar_expanded_size = 180.0;
  static const tile_width = 148.0;
  static const tile_height = 276.0;

  // between two = element
  static const sizedBoxBetweenEqual = 30.0;

  // between two != element
  static const sizedBoxBetweenDifferent = 40.0;
}

class AppStyles {
  static const bold = TextStyle(
    color: AppColors.main,
    fontWeight: FontWeight.bold,
    fontSize: 15,
  );
  static const boldBlack = TextStyle(
    color: AppColors.black,
    fontWeight: FontWeight.bold,
    fontSize: 15,
  );
  static const dropDown = TextStyle(
    color: AppColors.black,
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );
  static const largeBoldBlack = TextStyle(
    color: AppColors.black,
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );

  static const header = TextStyle(
    color: AppColors.black,
    fontWeight: FontWeight.bold,
    fontSize: 20,
    height: 1,
  );

  static const normal = TextStyle(
    color: AppColors.main,
    fontWeight: FontWeight.normal,
    fontSize: 15,
  );

  static const largeNormal = TextStyle(
    color: AppColors.main,
    fontWeight: FontWeight.normal,
    fontSize: 16,
  );
  static const normalBlack = TextStyle(
    color: AppColors.black,
    fontWeight: FontWeight.normal,
    fontSize: 15,
  );

  static const normalRed = TextStyle(
    color: AppColors.red,
    fontWeight: FontWeight.normal,
    fontSize: 15,
    height: 1.25,
  );
}

