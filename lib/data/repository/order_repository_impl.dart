import 'package:flutter_burger_land/data/models/order_entity.dart';
import 'package:flutter_burger_land/data/repository/order_repository.dart';
import 'package:flutter_burger_land/data/services/firestore_service.dart';

class OrderRepositoryImpl extends OrderRepository {
  final FirestoreService _firestoreService;

  OrderRepositoryImpl(this._firestoreService);

  @override
  Future addOrder(Order order) async {
    await _firestoreService.addOrder(order);
  }
}
