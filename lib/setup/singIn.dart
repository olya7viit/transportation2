import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:transportation2/components/custom_button.dart';
import 'package:transportation2/components/text_form_field.dart';
import 'package:transportation2/config/theme.dart';
import 'package:transportation2/entity/firebase_user.dart';
import 'package:transportation2/entity/role.dart';
import 'package:transportation2/firebase/logic.dart';

import '../pages/driver/home.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
String errorEmail ='null';
String errorPassword='null';
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
            SizedBox(height: 200),
            CustomInputField(
             // key: emailKey,
             // controller: emailController,
              label: 'E-mail',
             hint: 'E-mail',
             error: errorEmail,
             // validator: Validator.validateEmail,
              keyboard: TextInputType.emailAddress,
              hasTopMargin: false,
              onValueChanged: saveEmail,
            ),
            SizedBox(height: 20),
            CustomInputField(
              error: errorPassword,
              hint: 'Password',
          //   key: passwordKey,
             // controller: passwordController,
              label: '*Passwort',
             // validator: Validator.passwordCorrect,
              keyboard: TextInputType.visiblePassword,
              isPassword: true,
              hasTopMargin: false,
              onValueChanged: savePassword,
            ),
            SizedBox(height: 20),
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
    if(validateEmail(_email) != null||validatePassword(_password)!=null){
      setState(() {

      });
    }
    if (validateEmail(_email) == null&&validatePassword(_password)==null) {
      if(_formState.validate()){
        _formState.save();
        await FirebaseLogic
            .signInWithEmailAndPassword(
            email: _email,
            password: _password)
            .then((result) async {
          if (result != null) {
            Role role = await FirebaseLogic.findRoleByEmail(_email);

            CustomFirebaseUser user = new CustomFirebaseUser(
                email: _email, password: _password, role: role);

            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home(firebaseUser: user, currentTab: 0,),)
            );
          }
          else
          {
            errorPassword='Неверный логин или пароль';
            setState(() {

            });
          }
        });
       }
    }
  }

  String validateEmail(dynamic value) {
    if(value==null){
      errorEmail = "Email обязателен";
      return "Email обязателен";
    }
    if (value.length == 0) {
      errorEmail = "Email обязателен";
      return "Email обязателен";
    }
    errorEmail = 'null';
    return null;
  }

  String validatePassword(dynamic value) {
    print('ddd');
    if(value==null){
      errorPassword= "Пароль обязателен";
      return "Пароль обязателен";
    }
    if (value.length == 0) {
      errorPassword= "Пароль обязателен";
      return "Пароль обязателен";
    }
    errorEmail = "null";
    return null;
  }

}