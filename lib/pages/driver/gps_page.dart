import 'dart:async' as asyc;
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:transportation2/components/navigation_bar.dart';
import 'package:transportation2/config/theme.dart';
import 'package:transportation2/entity/firebase_user.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Page1 extends StatefulWidget {
  final int currentTab;
  final CustomFirebaseUser firebaseUser;

  Page1({this.currentTab, this.firebaseUser});

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  PolylinePoints polylinePoints = PolylinePoints();
  Map<PolylineId, Polyline> polylines = {};
  int count =0;
  Position position;
  asyc.Completer<GoogleMapController> _controller = asyc.Completer();
  Set<Marker> allMarkers = HashSet<Marker>();
  LatLng _initialPosition = LatLng(53.9025457, 27.492217900000014);
  String searchAddr = 'Минск';
  asyc.Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  asyc.Future<String> _name;
  @override
  void initState() {
    super.initState();
    _getUserLocation();
    _name = _prefs.then((SharedPreferences prefs) {
      return (prefs.getString('countryName'));
    });
searchandNavigate();
  }



  Future<void> _setName(String name) async {
    final SharedPreferences prefs = await _prefs;

    setState(() {
      _name = prefs.setString("countryName", name).then((bool success) {
      });
    });
  }


  _addPolyLine(List<LatLng> polylineCoordinates) {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.green,
      points: polylineCoordinates,
      width: 8,
    );
    polylines[id] = polyline;
    setState(() {});
  }

  void _getPolyline( var originPoint, var destinationPoint) async {
    List<LatLng> polylineCoordinates = [];

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      "AIzaSyD3JVbwCygZFbGfEmAmh0Afi3d7sOAUyUw",
      PointLatLng(originPoint.latitude, originPoint.longitude),
      PointLatLng(destinationPoint.coordinates.latitude,destinationPoint.coordinates.longitude),
      travelMode: TravelMode.driving,
    );
    if (result.points.isNotEmpty) {

        result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    } else {
      print(result.errorMessage);
    }
    _addPolyLine(polylineCoordinates);
  }


  void _getUserLocation() async {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _initialPosition = LatLng(position.latitude, position.longitude);

    });
  }
  MapType _currentMapType = MapType.normal;
  Future<void> setPosition (var first) async {
    final GoogleMapController mapController = await _controller.future;
    _getPolyline(position, first);
    allMarkers=HashSet<Marker>();
    setState(() {
      allMarkers.add(Marker(
          markerId: MarkerId("IdMArker"+"$count"),
          position: new LatLng(first.coordinates.latitude, first.coordinates.longitude)
      ));
      count++;
      mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          target:
          new LatLng(first.coordinates.latitude, first.coordinates.longitude),
          zoom: 7.0)));
    });


  }
  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }
  searchandNavigate() async {
    String val= await _name;
    print(val);
    if(searchAddr=="Минск"&& val!=null){
      searchAddr = await _name;
    }

      _setName(searchAddr);
    if(searchAddr!="Минск"){
      var adresses = await Geocoder.local.findAddressesFromQuery(searchAddr);
      var first = adresses.first;
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      print(position);
      print(first.coordinates.longitude);
      if(first!=null){
        setPosition(first);
      }
    }

  }


  Widget build(BuildContext context) {
    double heightAppBar = screenHeight(context, dividedBy: 10);
    void _onMapCreated(GoogleMapController controller) {
      _controller.complete(controller);
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
      body: Stack(
        children: <Widget>[

          GoogleMap(

            mapType: _currentMapType,
            myLocationEnabled: true,
            rotateGesturesEnabled: true,
            myLocationButtonEnabled: true,
            compassEnabled: true,
            onMapCreated: _onMapCreated,
            polylines: Set<Polyline>.of(polylines.values),
            initialCameraPosition: CameraPosition(
              target: _initialPosition,
              zoom: 11.0,
            ),
            markers: allMarkers,
          ),
          Positioned(
            top: 5.0,
            right: 70.0,
            left: 3.0,
            child: Container(
              height: 50.0,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0), color: Colors.white),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Enter Address',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
                    suffixIcon: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: searchandNavigate,
                        iconSize: 30.0)),
                onChanged: (val) {
                    searchAddr = val;
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 100, 10, 0),
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                width: 40,
                height: 40,
                child: FloatingActionButton(

                  onPressed: _onMapTypeButtonPressed,
                  materialTapTargetSize: MaterialTapTargetSize.padded,
                  backgroundColor: Colors.white,
                  child: const Icon(Icons.map, size: 30.0,color: Colors.grey,),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
