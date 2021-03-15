import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:transportation2/components/custom_button.dart';
import 'package:transportation2/components/text_form_field.dart';
import 'package:transportation2/entity/firebase_user.dart';
import 'package:transportation2/firebase/logic.dart';
import 'package:transportation2/pages/home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormRegister(
              labelText: "Email",
              validator: validateEmail,
              /*validator: (input) {
                if(input.IsEmpty){
                  return "Please type an email";
                }
              },*/
              chooseValue: saveEmail,
            ),
            TextFormRegister(
              labelText: "Password",
              validator: validatePassword,
              /*validator: (input) {
                if(input.IsEmpty){
                  return "Your password needs to be atleast 6 characters";
                }
              },*/
              chooseValue: savePassword,
            ),
            CustomButton(
              onTap: _signIn,
              buttonName: "Sing in",),
          ],
        ),
      ),
    );
  }

  Widget _appBar = AppBar(
    title: Text("Sign in"),
  );

  saveEmail(String email) {
    setState(() {
      _email = email;
    });
  }

  savePassword(String password) {
    setState(() {
      _password = password;
    });
  }

  void _signIn() async {
    final _formState = _formKey.currentState;
    if (validateEmail(_email) == null) {
      if(_formState.validate()){
        _formState.save();
        await FirebaseLogic
            .signInWithEmailAndPassword(
            email: _email,
            password: _password)
            .then((result) async {
          if (result != null) {
            CustomFirebaseUser user = new CustomFirebaseUser(
                email: _email, password: _password);

            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home(firebaseUser: user, currentTab: 0,),)
            );
          }
        });
       }
    }
  }

  String validateEmail(dynamic value) {
    if (value.length == 0) {
      return "email обязателен";
    }
    return null;
  }

  String validatePassword(dynamic value) {
    if (value.length == 0) {
      return "пароль обязателен";
    }
    return null;
  }

}