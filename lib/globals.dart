import 'package:flutter_burger_land/data/models/food_entity.dart';
import 'package:flutter_burger_land/data/models/languages_entity.dart';
import 'package:flutter_burger_land/data/models/order_item_entity.dart';
import 'package:flutter_burger_land/data/models/user_data_entity.dart';

List<OrderItem> order = List.empty(growable: true);

List<OrderItem> russianOrder = List.empty(growable: true);

List<OrderItem> ukrainianOrder = List.empty(growable: true);

bool userLogedIn = false;

late UserData currentUser;

late String email;

String language = Languages.UKRAINIAN;

String selectedCategory = 'Бургеры';

List<Food> listFood = List.empty();

List<Food> ukrainianListFood = List.empty();

List<Food> russianListFood = List.empty();
