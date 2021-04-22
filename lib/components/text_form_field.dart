import 'package:transportation2/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomInputField extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final String label;
  final String helperText;
  final FormFieldValidator validator;
  final TextInputType keyboard;
  final FocusNode focusNode;
  final bool isPassword;
  final Function onValueChanged;
  final Function onTap;
  final String error;
  final bool isReadOnly;
  final Image prefix;
  final int maxLength;
  final String suffixText;
  final bool hasSidePadding;
  final int maxLines;
  final bool hasTopMargin;

  const CustomInputField({
    Key key,
    @required this.controller,
    this.hint,
    this.label,
    this.helperText,
    this.validator,
    this.keyboard,
    this.focusNode,
    this.isPassword = false,
    this.onValueChanged,
    this.error,
    this.isReadOnly = false,
    this.onTap,
    this.prefix,
    this.maxLength,
    this.suffixText,
    this.hasSidePadding = true,
    this.maxLines = 1,
    this.hasTopMargin = true,
  }) : super(key: key);

  @override
  _CustomInputFieldState createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  String error;
  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
error= 'null';
    // ignore: unnecessary_statements

    widget.error == 'null' ? null : error = widget.error;
    return Container(
      margin: EdgeInsets.only(top: widget.hasTopMargin ? 20 : 0),
      padding: widget.hasSidePadding ? AppPadding.side : null,
      child: Column(
        children: <Widget>[
          TextFormField(

            inputFormatters: [
              LengthLimitingTextInputFormatter(widget.maxLength), // for mobile
            ],
            cursorWidth: AppSizes.cursorWidth,
            cursorColor: AppColors.black,
            validator: widget.validator,
            onTap: () => widget.onTap == null ? null : widget.onTap(),
            readOnly: widget.isReadOnly,
            onChanged: (value) => widget.onValueChanged(value),
            style: AppStyles.boldBlack,
            controller: widget.controller,
            focusNode: widget.focusNode,
            keyboardType:
            widget.keyboard == null ? TextInputType.text : widget.keyboard,
            obscureText: !passwordVisible & widget.isPassword,
            minLines: 1,
            maxLines: widget.maxLines,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.only(
                  bottom: 12,
                  top: 17,
                  left: 20,
                  right: widget.suffixText != null ? 10 : 20),
              prefix: widget.prefix,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              focusedBorder: OutlineInputBorder(
                gapPadding: AppSizes.indentVerySmall,
                borderRadius: BorderRadius.circular(AppSizes.borderRadius),
                borderSide: BorderSide(
                  width: AppSizes.lineWidth,
                  color: AppColors.main,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                gapPadding: AppSizes.indentVerySmall,
                borderRadius: BorderRadius.circular(AppSizes.borderRadius),
                borderSide: BorderSide(
                  width: AppSizes.lineWidth,
                  color: AppColors.main,
                ),
              ),
              errorBorder: OutlineInputBorder(
                  gapPadding: AppSizes.indentVerySmall,
                  borderRadius: BorderRadius.circular(AppSizes.borderRadius),
                  borderSide: BorderSide(
                    width: AppSizes.lineWidth,
                    color: AppColors.red,
                  )),
              labelText: widget.label,
              labelStyle: TextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.normal,
                fontSize: 14,
                height: 0.7,
              ),
              hintText: widget.hint,
              hintStyle: AppStyles.normalBlack,
              helperText: widget.helperText,
              helperStyle: TextStyle(
                  color: AppColors.main,
                  fontSize: 13,
                  fontWeight: FontWeight.normal),
              suffixIcon: widget.isPassword
                  ? IconButton(
                icon: Icon(
                  // Based on passwordVisible state choose the icon
                  passwordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: AppColors.main,
                ),
                onPressed: () {
                  // Update the state i.e. toogle the state of passwordVisible variable
                  setState(() {
                    passwordVisible = !passwordVisible;
                  });
                },
              )
                  : widget.suffixText != null
                  ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Text(
                      widget.suffixText,
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              )
                  : null,
            ),
          ),
          error == 'null'
              ? Container()
              : Text(
            error,
            style: TextStyle(color: AppColors.red, fontSize: 12),
          )
        ],
      ),
    );
  }

  String validate() {
    setState(
          () {
        error = widget.validator(widget.controller.text);
        //print("ERROR VALIDATOR " + error.toString());
      },
    );
    return error;
  }
}
