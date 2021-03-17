import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:transportation2/components/navigation_bar.dart';
import 'package:transportation2/config/theme.dart';
import 'package:transportation2/entity/firebase_user.dart';

class Page1 extends StatefulWidget {

  final int currentTab;
  final CustomFirebaseUser firebaseUser;

  Page1({this.currentTab, this.firebaseUser});

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {

    double heightAppBar= screenHeight(context,dividedBy: 10);
    GoogleMapController mapController;

    final LatLng _center = const LatLng(45.521563, -122.677433);

    void _onMapCreated(GoogleMapController controller) {
      mapController = controller;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("GPS"),
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
      body: Container(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                child: GoogleMap(
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: _center,
                    zoom: 11.0,
                  ),
                ),
              )
            ),
            Expanded(
              flex: 1,
              child: Container()
            )
          ],
        ),
      ),
    );
  }
}
