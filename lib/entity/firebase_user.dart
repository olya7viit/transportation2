import 'package:transportation2/entity/role.dart';

class CustomFirebaseUser {
  String email;
  String password;
  Role role;

  CustomFirebaseUser({this.email, this.password, this.role});
}