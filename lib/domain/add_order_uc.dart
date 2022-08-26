import 'package:flutter_burger_land/data/models/order_entity.dart';
import 'package:flutter_burger_land/data/repository/order_repository.dart';

class AddOrderUC {
  final OrderRepository _orderRepository;

  AddOrderUC(this._orderRepository);

  Future call(Order order) async {
    await _orderRepository.addOrder(order);
  }
}
