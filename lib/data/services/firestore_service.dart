import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_burger_land/data/models/food_entity.dart';
import 'package:flutter_burger_land/data/models/order_entity.dart';
import 'package:flutter_burger_land/data/models/user_data_entity.dart';

class FirestoreService {
  FirebaseFirestore db = FirebaseFirestore.instance;

  Future<List<Food>> getFoodByCollection(String collectionName) async {
    var food = <Food>[];
    await db
        .collection(collectionName)
        .get()
        // ignore: avoid_function_literals_in_foreach_calls
        .then((querySnapshot) => querySnapshot.docs.forEach((element) {
              food.add(Food.fromMap(element.data()));
            }));
    return food;
  }

  Future<UserData> getUserData(String uid) async {
    // ignore: prefer_typing_uninitialized_variables
    var user;
    await db.collection('users').doc(uid).get().then((snapshot) {
      user = UserData.fromFirestore(snapshot);
    });
    return user;
  }

  Future addUserData(UserData user, String uid) async {
    await db.collection('users').doc(uid).set(user.toMap());
  }

  Future addOrder(Order order) async {
    await db.collection('orders').doc().set(order.toMap());
  }
}
