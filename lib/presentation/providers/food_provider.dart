import 'package:flutter/widgets.dart';
import 'package:flutter_burger_land/data/models/food_entity.dart';
import 'package:flutter_burger_land/domain/get_food_uc.dart';

class FoodProvider with ChangeNotifier {
  final GetFoodUC _getFoodUC;

  FoodProvider(this._getFoodUC);

  List<Food> _burgers = List.empty();
  List<Food> _pizza = List.empty();
  List<Food> _sandwiches = List.empty();

  List<Food> _ukrainianBurgers = List.empty();
  List<Food> _ukrainianPizza = List.empty();
  List<Food> _ukrainianSandwiches = List.empty();

  List<Food> _russianBurgers = List.empty();
  List<Food> _russianPizza = List.empty();
  List<Food> _russianSandwiches = List.empty();

  String _errorMessage = "";

  List<Food> get burgers => _burgers;
  List<Food> get pizza => _pizza;
  List<Food> get sandwiches => _sandwiches;

  List<Food> get ukrainianBurgers => _ukrainianBurgers;
  List<Food> get ukrainianPizza => _ukrainianPizza;
  List<Food> get ukrainianSandwiches => _ukrainianSandwiches;

  List<Food> get russianBurgers => _russianBurgers;
  List<Food> get russianPizza => _russianPizza;
  List<Food> get russianSandwiches => _russianSandwiches;

  String get errorMessage => _errorMessage;

  void getFood(String collectionName) async {
    try {
      switch (collectionName) {
        case 'burgers':
          _burgers = await _getFoodUC(collectionName);
          _ukrainianBurgers = await _getFoodUC('ukrainian ' + collectionName);
          _russianBurgers = await _getFoodUC('russian ' + collectionName);
          break;

        case 'pizza':
          _pizza = await _getFoodUC(collectionName);
          _ukrainianPizza = await _getFoodUC('ukrainian ' + collectionName);
          _russianPizza = await _getFoodUC('russian ' + collectionName);
          break;

        case 'sandwiches':
          _sandwiches = await _getFoodUC(collectionName);
          _ukrainianSandwiches =
              await _getFoodUC('ukrainian ' + collectionName);
          _russianSandwiches = await _getFoodUC('russian ' + collectionName);
          break;
      }
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      notifyListeners();
    }
  }
}
