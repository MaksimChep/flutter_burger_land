import 'package:flutter_burger_land/data/models/order_item_entity.dart';

class Order {
  final String customerName;
  final String customerSurname;
  final String customerAddress;
  final String customerCity;
  final List<OrderItem> items;
  final String totalCost;
  final String status = "New";

  Order(
      {required this.customerName,
      required this.customerSurname,
      required this.customerAddress,
      required this.customerCity,
      required this.items,
      required this.totalCost});

  Map<String, dynamic> toMap() => {
        'customerName': customerName,
        'customerSurname': customerSurname,
        'customerAddress': customerAddress,
        'customerCity': customerCity,
        'orderList': _listToMap(),
        'totalCost': totalCost,
        'status': status
      };

  List<Map<String, dynamic>> _listToMap() {
    List<Map<String, dynamic>> lst = List.empty(growable: true);
    for (var element in items) {
      lst.add(element.toMap());
    }
    return lst;
  }
}
