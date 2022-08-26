import 'package:flutter_burger_land/data/models/food_entity.dart';
import 'package:flutter_burger_land/data/repository/food_repository.dart';

class GetFoodUC {
  final FoodRepository _foodRepository;

  GetFoodUC(this._foodRepository);

  Future<List<Food>> call(String collectionName) async {
    var food = await _foodRepository.getFoodCollection(collectionName);
    return food;
  }
}
