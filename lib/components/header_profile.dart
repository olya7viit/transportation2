import 'dart:io';
import 'dart:async' as asyc;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transportation2/config/theme.dart';

class HeaderProfile extends StatefulWidget {
  final String role;

  HeaderProfile(this.role);

  @override
  _HeaderProfileState createState() => _HeaderProfileState();
}

class _HeaderProfileState extends State<HeaderProfile> {
  File _image;
  asyc.Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String _imagePath = 'null';
  asyc.Future<String> _imagePathFuture;
  final picker = ImagePicker();

  Future<void> _setPath(String name) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString("imagePath", name).then((bool success) {});
  }

  Future<void> _setDelete() async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString("imagePath", 'null').then((bool success) {});
    _imagePath = "null";
    setState(() {

    });
  }

  @override
  void initState() {
    super.initState();
    _imagePathFuture = _prefs.then((SharedPreferences prefs) {
      return (prefs.getString('imagePath'));
    });
    setPath();
  }

  void setPath() async {
    _imagePath = await _imagePathFuture;
    setState(() {});
  }

  BoxShadow cBoxShadowCircle({BuildContext context, double dividedBy}) {
    return BoxShadow(
      color: Colors.black.withOpacity(0.25),
      //color: Color(0xff305240),
      blurRadius: screenHeight(context, dividedBy: dividedBy),
      spreadRadius: 0.5,
      offset: Offset(0, 2), // changes position of shadow
    );
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _imagePath = pickedFile.path;
        _setPath(_imagePath);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double margin = screenWidth(context, dividedBy: 18);
    double screen_height = MediaQuery.of(context).size.height;
    double textSize = MediaQuery.of(context).size.height * 0.03;
    return Container(
      width: double.infinity,
      color: AppColors.blue,
      child: Container(
          margin: EdgeInsets.all(margin),
          child: Column(
            children: [
              _imagePath != 'null'
                  ? Stack(
                      alignment: AlignmentDirectional.center,
                      children: <Widget>[
                        Container(
                          height: screenHeight(context, dividedBy: 5.3),
                          width: screenHeight(context, dividedBy: 5.3),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              cBoxShadowCircle(context: context, dividedBy: 200)
                            ],
                          ),
                          child: GestureDetector(
                            onTap: () async {
                              getImage();
                            },
                            onLongPress: () {
                              _setDelete();
                            },
                            child: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              backgroundImage: AssetImage(_imagePath),
                            ),
                          ),
                        ),
                      ],
                    )
                  : GestureDetector(
                      onTap: () async {
                        getImage();
                      },
                      child: Icon(
                        Icons.person_pin,
                        color: AppColors.white,
                        size: screen_height * 0.2,
                      ),
                    ),
              SizedBox(
                height: 7,
              ),
              Text(
                "${widget.role}",
                style: TextStyle(color: AppColors.white, fontSize: textSize),
              )
            ],
          )),
    );
  }
}
