import 'package:flutter_burger_land/data/models/order_entity.dart';

abstract class OrderRepository {
  Future addOrder(Order order);
}
