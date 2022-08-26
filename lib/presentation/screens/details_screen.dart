import 'package:flutter/material.dart';
import 'package:flutter_burger_land/data/models/food_entity.dart';
import 'package:flutter_burger_land/data/models/languages_entity.dart';
import 'package:flutter_burger_land/data/models/order_item_entity.dart';
import 'package:flutter_burger_land/presentation/widgets/details/details_central_widget.dart';
import 'package:flutter_burger_land/presentation/widgets/details/details_description_widget.dart';
import 'package:flutter_burger_land/presentation/widgets/details/details_head_widget.dart';
import 'package:flutter_burger_land/globals.dart' as globals;

class DetailsScreen extends StatefulWidget {
  const DetailsScreen(
      {Key? key,
      required this.food,
      required this.ukrainianFood,
      required this.russianFood})
      : super(key: key);
  final Food food;
  final Food ukrainianFood;
  final Food russianFood;
  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int _count = 1;
  set count(int value) => setState(() => _count = value);
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
      height: screenHeight,
      width: screenWidth,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/details_background.png'),
              fit: BoxFit.cover)),
      child: SafeArea(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Spacer(flex: 1),
        Expanded(flex: 1, child: DetailsHead()),
        const Spacer(flex: 2),
        Expanded(
            flex: 10,
            child: DetailsCentral(
              food: globals.language == Languages.UKRAINIAN
                  ? widget.ukrainianFood
                  : globals.language == Languages.ENGLISH
                      ? widget.food
                      : widget.russianFood,
              onSonChanged: (int newCount) {
                setState(() {
                  _count = newCount;
                });
              },
            )),
        const Spacer(flex: 1),
        Expanded(
            flex: 8,
            child: DetailsDescription(
              description: globals.language == Languages.UKRAINIAN
                  ? widget.ukrainianFood.description
                  : globals.language == Languages.ENGLISH
                      ? widget.food.description
                      : widget.russianFood.description,
            )),
        const Spacer(flex: 1),
        Align(
            alignment: Alignment.center,
            child: GestureDetector(
                onTap: () {
                  String strPrice = globals.language == Languages.UKRAINIAN
                      ? widget.ukrainianFood.firstCost.substring(2) +
                          widget.ukrainianFood.secondCost
                      : globals.language == Languages.ENGLISH
                          ? widget.food.firstCost.substring(2) +
                              widget.food.secondCost
                          : widget.russianFood.firstCost.substring(2) +
                              widget.russianFood.secondCost;
                  double price = double.parse(strPrice);
                  addToCart(widget.food, price, globals.order);
                  addToCart(widget.russianFood, price, globals.russianOrder);
                  addToCart(
                      widget.ukrainianFood, price, globals.ukrainianOrder);

                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                    globals.language == Languages.UKRAINIAN
                        ? widget.ukrainianFood.name +
                            " х $_count додано до кошика"
                        : globals.language == Languages.ENGLISH
                            ? widget.food.name + " х $_count added to a cart"
                            : widget.russianFood.name +
                                " х $_count добавлено в корзину",
                  )));
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(45),
                      color: const Color.fromRGBO(255, 255, 255, 0.45)),
                  height: screenHeight * 0.0388,
                  width: screenWidth * 0.676,
                  child: Align(
                      alignment: Alignment.center,
                      child: Text(
                          globals.language == Languages.UKRAINIAN
                              ? 'Додати до кошика'
                              : globals.language == Languages.ENGLISH
                                  ? 'Add to a cart'
                                  : 'Добавить в корзину',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'SF Pro Display',
                              fontWeight: FontWeight.w400,
                              fontSize: screenHeight * 0.022))),
                ))),
        const Spacer(flex: 10)
      ])),
    ));
  }

  void addToCart(Food food, double price, List<OrderItem> order) {
    int index = -1;
    bool isPresent = false;
    for (int i = 0; i < order.length; i++) {
      if (order[i].name == food.name) {
        isPresent = true;
        index = i;
      }
    }
    if (!isPresent) {
      order.add(OrderItem(
          image: food.image, name: food.name, count: _count, cost: price));
    } else {
      int elementCount = order[index].count + _count;
      order[index].count = elementCount;
      order[index].cost = price;
    }
  }
}
