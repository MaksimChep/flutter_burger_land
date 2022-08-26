import 'package:flutter/material.dart';
import 'package:flutter_burger_land/data/models/languages_entity.dart';
import 'package:flutter_burger_land/data/models/order_entity.dart';
import 'package:flutter_burger_land/globals.dart' as globals;
import 'package:flutter_burger_land/presentation/providers/location_provider.dart';
import 'package:flutter_burger_land/presentation/providers/order_provider.dart';
import 'package:flutter_burger_land/presentation/screens/home_screen.dart';
import 'package:flutter_burger_land/presentation/widgets/home/home_widgets.dart';
import 'package:flutter_burger_land/presentation/widgets/order/order_bottom_navigation_bar_widget.dart';
import 'package:flutter_burger_land/presentation/widgets/order/order_list_widget.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  // ignore: prefer_typing_uninitialized_variables
  late var location;
  String summary = getSummary();
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    location = context.watch<LocationProvider>();
    return Scaffold(
      backgroundColor: const Color(0xFFE5E5E5),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(flex: 2, child: HomeHead(location: location.location)),
          const Spacer(flex: 1),
          Expanded(
              flex: 1,
              child: Text(
                  globals.language == Languages.UKRAINIAN
                      ? 'Кошик'
                      : globals.language == Languages.ENGLISH
                          ? 'Сart'
                          : 'Корзина',
                  style: TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w700,
                      fontSize: screenHeight * 0.03))),
          const Spacer(flex: 1),
          Expanded(
              flex: 10,
              child: OrderList(onSonChanged: () {
                setState(() {
                  summary = getSummary();
                });
              })),
          const Spacer(flex: 1),
          Expanded(
              flex: 1,
              child: Row(
                children: [
                  Padding(
                      padding: EdgeInsets.only(
                          left: screenWidth * 0.015, right: screenWidth * 0.07),
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(45),
                              boxShadow: const [
                                BoxShadow(
                                    blurRadius: 5,
                                    color: Color.fromRGBO(0, 0, 0, 0.15),
                                    offset: Offset(0, 5))
                              ]),
                          child: GestureDetector(
                              onTap: () async {
                                Order order = Order(
                                    customerName: globals.currentUser.name,
                                    customerSurname:
                                        globals.currentUser.surname,
                                    customerAddress: globals.currentUser.adress,
                                    customerCity: globals.currentUser.city,
                                    items: globals.russianOrder,
                                    totalCost: getSummary());
                                final orderProvider =
                                    Provider.of<OrderProvider>(context,
                                        listen: false);
                                await orderProvider.addOrder(order);
                                if (orderProvider.errorMessage == "") {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                          content: Text(
                                    globals.language == Languages.UKRAINIAN
                                        ? "Замовлення прийнято"
                                        : globals.language == Languages.ENGLISH
                                            ? "Order is accepted"
                                            : "Заказ принят",
                                  )));
                                  globals.order.clear();
                                  globals.russianOrder.clear();
                                  globals.ukrainianOrder.clear();
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const HomeScreen()),
                                      (route) => false);
                                } else {
                                  orderProvider.resetErrorMessage();
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(45),
                                    color: Colors.white),
                                height: screenHeight * 0.0388,
                                width: screenWidth * 0.676,
                                child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                        globals.language == Languages.UKRAINIAN
                                            ? 'Замовити'
                                            : globals.language ==
                                                    Languages.ENGLISH
                                                ? 'Order'
                                                : 'Заказать',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'SF Pro Display',
                                            fontWeight: FontWeight.w600,
                                            fontSize: screenHeight * 0.022))),
                              )))),
                  Text('\$ ' + getSummary(),
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w600,
                          fontSize: screenHeight * 0.022))
                ],
              )),
          const Spacer(flex: 2)
        ],
      )),
      bottomNavigationBar: OrderBottomNavigationBar(
        onSonChanged: () {
          setState(() {});
        },
      ),
    );
  }
}

String getSummary() {
  double summary = 0;
  for (var element in globals.order) {
    summary += element.cost * element.count;
  }
  return summary.toStringAsFixed(2);
}
