import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  CustomButton({@required this.onTap, this.buttonName});
  final Function onTap;
  String buttonName;
  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: widget.onTap,
      child: Text(widget.buttonName),
    );
  }
}
