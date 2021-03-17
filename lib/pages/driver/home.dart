import 'package:flutter/material.dart';
import 'package:transportation2/components/navigation_bar.dart';
import 'package:transportation2/config/theme.dart';
import 'package:transportation2/entity/firebase_user.dart';
import 'package:transportation2/entity/role.dart';

class Home extends StatefulWidget {
  final CustomFirebaseUser firebaseUser;
  final int currentTab;

  Home({Key key, this.firebaseUser, @required this.currentTab,}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {

    double heightAppBar= screenHeight(context,dividedBy: 10);

    String role = widget.firebaseUser.role == Role.user
        ? "User"
        : "Driver";

    return Scaffold(
      appBar: AppBar(
        title: Text("$role ${widget.firebaseUser.email}"),
      ),
      bottomNavigationBar: SizedBox(
        height: heightAppBar,
        child: GradientBottomNavBar(
          currentTab: widget.currentTab,
          heightBar: heightAppBar,
          firebaseUser: widget.firebaseUser,
        ),
      ),
      body: Text("home"),
    );
  }

}
