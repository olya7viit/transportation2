import 'package:flutter/material.dart';
import 'package:transportation2/config/theme.dart';

class HeaderProfile extends StatelessWidget {

  final String role;

  HeaderProfile(this.role);

  @override
  Widget build(BuildContext context) {
    double margin = screenWidth(context,dividedBy: 18);
    double screen_height = MediaQuery.of(context).size.height;
    double textSize = MediaQuery.of(context).size.height * 0.03;

    return Container(
      width: double.infinity,
      color: AppColors.blue,
      child: Container(
          margin: EdgeInsets.all(margin),
          child: Column(
            children: [
              Icon(
                Icons.person_pin,
                color: AppColors.white,
                size: screen_height * 0.2,
              ),
              Text(
                "$role",
                style: TextStyle(
                    color: AppColors.white,
                    fontSize: textSize
                ),
              )
            ],
          )
      ),
    );
  }
}
