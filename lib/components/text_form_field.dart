import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFormRegister extends StatefulWidget {
  final Function(String) chooseValue;
  //BuildContext context;
  //TextEditingController controller;
  FormFieldValidator validator;
  //TextInputType textInputType;
  String labelText;
//  String hintText;
 // bool isScreenRegister;
 // bool isRegistration = false;

  //String suffixText;

  TextFormRegister({
    this.chooseValue,
    this.validator,
    this.labelText
  });

  //TextFormRegister(this.chooseValue);

  @override
  TextFormRegisterWidget createState() => TextFormRegisterWidget();
}

class TextFormRegisterWidget extends State<TextFormRegister> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.only(
      //   left: screenWidth(context, dividedBy: 15),
      //   right: screenWidth(context, dividedBy: 15),
      //   //top: screenHeight(context, dividedBy: 40),
      //   bottom:
      //   screenHeight(context, dividedBy: widget.isScreenRegister ? 17 : 20),
      // ),
      child: TextFormField(
          validator: widget.validator,
          onChanged: (value) {
            widget.chooseValue(value);
            //textFormValue = value;
          },
          decoration: InputDecoration(
          labelText: widget.labelText,
        ),
      ),
    );
  }
}
