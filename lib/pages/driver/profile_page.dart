import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transportation2/components/header_profile.dart';
import 'package:transportation2/components/navigation_bar.dart';
import 'package:transportation2/config/theme.dart';
import 'package:transportation2/entity/driver.dart';
import 'package:transportation2/entity/firebase_user.dart';
import 'package:transportation2/entity/role.dart';
import 'package:transportation2/firebase/logic.dart';

class ProfileDriver extends StatefulWidget {
  final int currentTab;
  final CustomFirebaseUser firebaseUser;

  ProfileDriver({this.currentTab, this.firebaseUser});

  @override
  _ProfileDriverState createState() => _ProfileDriverState();
}

class _ProfileDriverState extends State<ProfileDriver> {

  String role;
  Future<Driver> futureDriver;

  @override
  void initState() {
    super.initState();
    widget.firebaseUser.role == Role.user
      ? role = "USER"
      : role = "DRIVER";
  }

  @override
  Widget build(BuildContext context) {
    double heightAppBar= screenHeight(context,dividedBy: 10);

    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
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
          Expanded(
            flex: 2,
              child: HeaderProfile(role),
          ),
          Expanded(
              flex: 3,
              child: FutureBuilder(
                future: FirebaseLogic.getDriverByEmail(widget.firebaseUser.email),
                builder: (context, snapshot) {
                  if( snapshot.connectionState == ConnectionState.waiting){
                    return  Center(child: Text('Please wait its loading...'));
                  }else{
                    if (snapshot.hasError)
                      return Center(child: Text('Error: ${snapshot.error}'));
                    else
                      return ListView(
                        children: <Widget>[
                          Card(
                              child: ListTile(
                                  title: Text(
                                      "${snapshot.data["firstName"]} "
                                          "${snapshot.data["lastName"]}"
                                  )
                              )
                          ),
                          Card(
                            child: ListTile(
                              leading: Icon(Icons.email),
                              title: Text("Email"),
                              subtitle: Text('${snapshot.data["email"]}'),
                            ),
                          ),
                          Card(
                            child: ListTile(
                              leading: Icon(Icons.lock),
                              title: Text("Password"),
                              subtitle: Text('${snapshot.data["password"]}'),
                            ),
                          ),
                          Card(
                            child: ListTile(
                              leading: Icon(Icons.monetization_on),
                              title: Text('Payment'),
                              subtitle: Text('${snapshot.data["driverPayment"]}'),
                              trailing: Icon(Icons.more_vert),
                            ),
                          ),
                          Card(
                            child: ListTile(
                              leading: Icon(Icons.work),
                              title: Text('Work experience'),
                              subtitle: Text('${snapshot.data["drivingExperience"]}'),
                            ),
                          ),
                        ],
                      );  // snapshot.data  :- get your object which is pass from your downloadData() function
                  }
                },
              ),
          )
          //Container(color: Colors.red,)
        ],
      ),
    );
  }
}
