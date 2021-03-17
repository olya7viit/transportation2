import 'package:flutter/material.dart';

class AppColors{
  static const blue = Colors.blue;
  static Color lightBlue = Colors.blue[200];
  static const white = Colors.white;
  static const dart = Colors.black12;
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