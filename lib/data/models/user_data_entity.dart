import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  UserData(
      {this.phoneNumber = "",
      this.name = "",
      this.surname = "",
      this.city = "",
      this.adress = ""});

  final String phoneNumber;
  final String name;
  final String surname;
  final String city;
  final String adress;

  factory UserData.fromMap(Map<String, dynamic> json) => UserData(
      name: json['name'],
      surname: json['surname'],
      phoneNumber: json['phoneNumber'],
      city: json['city'],
      adress: json['address']);

  Map<String, dynamic> toMap() => {
        'name': name,
        'surname': surname,
        'phoneNumber': phoneNumber,
        'city': city,
        'address': adress
      };

  factory UserData.fromFirestore(DocumentSnapshot snapshot) {
    var food = UserData.fromMap(snapshot.data() as Map<String, dynamic>);
    return food;
  }
}
