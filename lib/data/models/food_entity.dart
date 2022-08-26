import 'package:cloud_firestore/cloud_firestore.dart';

class Food {
  Food(
      {required this.name,
      required this.products,
      required this.firstCost,
      required this.secondCost,
      required this.image,
      required this.description});

  String name;
  final String products;
  final String firstCost;
  final String secondCost;
  final String image;
  final String description;

  factory Food.fromMap(Map<String, dynamic> json) => Food(
      name: json['name'] ?? '',
      products: json['products'] ?? '',
      firstCost: json['firstCost'] ?? '',
      secondCost: json['secondCost'] ?? '',
      image: json['image'] ?? '',
      description: json['description'] ?? '');

  Map<String, dynamic> toMap() => {
        'name': name,
        'products': products,
        'firstCost': firstCost,
        'secondCost': secondCost,
        'image': image,
        'description': description
      };

  factory Food.fromFirestore(DocumentSnapshot snapshot) {
    var food = Food.fromMap(snapshot.data() as Map<String, dynamic>);
    return food;
  }
}
