import 'package:flutter/widgets.dart';
import 'package:flutter_burger_land/data/models/order_entity.dart';
import 'package:flutter_burger_land/domain/add_order_uc.dart';

class OrderProvider with ChangeNotifier {
  final AddOrderUC _addOrderUC;

  OrderProvider(this._addOrderUC);

  String _errorMessage = "";

  String get errorMessage => _errorMessage;

  Future<void> addOrder(Order order) async {
    try {
      await _addOrderUC(order);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      notifyListeners();
    }
  }

  void resetErrorMessage() {
    _errorMessage = "";
  }
}
