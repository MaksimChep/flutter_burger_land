import 'package:flutter_burger_land/data/models/food_entity.dart';

abstract class FoodRepository {
  Future<List<Food>> getFoodCollection(String collectionName);
}
