import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:transportation2/entity/order.dart';
import 'package:transportation2/entity/role.dart';
import 'package:transportation2/entity/segment.dart';

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

  static Future getDriverByEmail(String email) async {
    CollectionReference ref = FirebaseFirestore.instance.collection('drivers');
    QuerySnapshot snapshot = await ref
        .where("email", isEqualTo: email)
        .get();
    return snapshot.docs[0];
  }

  static Future<Role> findRoleByEmail(String email) async {
    CollectionReference ref = FirebaseFirestore.instance.collection('roles');
    QuerySnapshot snapshot = await ref
        .where("email", isEqualTo: email)
        .get();
    return snapshot.docs[0].data()["role"] == "user"
        ? Role.user
        : Role.driver;
  }

  static Future<void> addSleepInfoForDriver({String driverId, Map<String, dynamic> sleepInfo}) async {
    var array = ["item1", "item2"];
    await FirebaseFirestore.instance
        .collection('drivers')
        .doc(driverId)
        .set({"myArray": array})
        .catchError((e) {
      print(e.toString());
    });
  }


  ///////////////////                 order            ///////////////////////////////////////////////////

  static Future<List<Order>> getListOrdersByDriverEmail(String email) async {
    Order _order;
    List<Order> _listOrders = [];
    return await FirebaseFirestore.instance
        .collection('orders')
    //.where("email", isEqualTo: "email")
        .get()
        .then((value) {
      if (value.docs.isNotEmpty) {
        value.docs.forEach((element) async {
          _order = Order.fromMap(element.data());
          _listOrders.add(_order);
        });
        return _listOrders;
      } else {
        return _listOrders;
      }
    }).catchError((e) {
      print(e.toString());
      return _listOrders;
    });
  }

  static Future<void> updateOrder(Order order) async {
    FirebaseFirestore.instance
        .collection('orders')
        .doc(order.id)
        .update(order.toMap()).catchError((e) {
      print("OOps");
    });
  }


}