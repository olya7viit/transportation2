import 'package:firebase_auth/firebase_auth.dart';

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
}