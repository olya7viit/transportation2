import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:transportation2/entity/driver.dart';
import 'package:transportation2/entity/role.dart';

class FirebaseLogic {
  static Future<User> signInWithEmailAndPassword({String email, String password}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      print("FirebaseAuthException");
      return null;
    } catch(e){
      print(e.message);
    }
  }

  static Future<Driver> getDriverByEmail(String email) async {
    CollectionReference ref = FirebaseFirestore.instance.collection('drivers');
    QuerySnapshot snapshot = await ref
        .where("email", isEqualTo: email)
        .get();
    return Driver.fromMap(snapshot.docs[0].data());
  }

  static Future getDriverByEmail2(String email) async {
    CollectionReference ref = FirebaseFirestore.instance.collection('drivers');
    QuerySnapshot snapshot = await ref
        .where("email", isEqualTo: email)
        .get();
    return snapshot.docs[0];
  }

  static Future<Role> findRoleByEmail(String email) async {
    CollectionReference ref = FirebaseFirestore.instance.collection('roles');
    print(ref.id.length);
    QuerySnapshot snapshot = await ref
        .where("email", isEqualTo: email)
        .get();
    return snapshot.docs[0].data()["role"] == "user"
        ? Role.user
        : Role.driver;
  }
}