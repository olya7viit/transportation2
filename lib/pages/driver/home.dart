import 'package:flutter/material.dart';

import 'package:transportation2/components/list_view_order.dart';
import 'package:transportation2/components/navigation_bar.dart';
import 'package:transportation2/config/theme.dart';
import 'package:transportation2/entity/firebase_user.dart';
import 'package:transportation2/entity/order.dart';
import 'package:transportation2/entity/role.dart';
import 'package:transportation2/firebase/logic.dart';


class Home extends StatefulWidget {
  final CustomFirebaseUser firebaseUser;
  final int currentTab;

  Home({Key key, this.firebaseUser, @required this.currentTab,}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {

  Map tapDetector;
  List<Order> listOrders;

  @override
  void initState() {
    super.initState();
    
  }

  Map createTapDetector() {
    Map tap = {};
    for (int i = 1; i <= listOrders.length; i++) {
      tap[i] = false;
    }
    return tap;
  }

  _getOrders() async {
    listOrders = await FirebaseLogic
        .getListOrdersByDriverEmail(widget.firebaseUser.email);
    tapDetector = createTapDetector();
  }

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
      body: Container(
        child: FutureBuilder(
          future: _getOrders(),
          builder: (context, snapshot) {
            if( snapshot.connectionState == ConnectionState.waiting){
              return  Center(child: CircularProgressIndicator());
            }else{
              if (snapshot.hasError)
                return Center(child: Text('Error: ${snapshot.error}'));
              else
                return ListViewOrder(listOrders: listOrders);
            }
          },
        ),
      ),
    );
  }
}
