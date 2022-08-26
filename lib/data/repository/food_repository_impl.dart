import 'package:flutter_burger_land/data/services/firestore_service.dart';
import 'package:flutter_burger_land/data/models/food_entity.dart';
import 'package:flutter_burger_land/data/repository/food_repository.dart';

class FoodRepositoryImpl extends FoodRepository {
  final FirestoreService _firestoreService;

  FoodRepositoryImpl(this._firestoreService);

  @override
  Future<List<Food>> getFoodCollection(String collectionName) async {
    var burgers = await _firestoreService.getFoodByCollection(collectionName);
    return burgers;
  }
}
