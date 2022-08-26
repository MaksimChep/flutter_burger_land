import 'package:flutter/material.dart';
import 'package:flutter_burger_land/data/models/languages_entity.dart';
import 'package:flutter_burger_land/globals.dart' as globals;

typedef VoidCallback = void Function();

class OrderList extends StatefulWidget {
  const OrderList({Key? key, required this.onSonChanged}) : super(key: key);
  final VoidCallback onSonChanged;

  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  late double screenHeight;
  late double screenWidth;
  int count = 1;
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return ListView.separated(
      itemCount: globals.order.length,
      itemBuilder: (BuildContext context, int index) {
        return Row(
          children: [
            Expanded(
                flex: 1,
                child: Image.network(
                  globals.order[index].image,
                  width: screenWidth * 0.279,
                  height: screenHeight * 0.107,
                )),
            Expanded(
                flex: 1,
                child: Padding(
                    padding: EdgeInsets.only(left: screenWidth * 0.015),
                    child: Text(
                        globals.language == Languages.UKRAINIAN
                            ? globals.ukrainianOrder[index].name
                            : globals.language == Languages.ENGLISH
                                ? globals.order[index].name
                                : globals.russianOrder[index].name,
                        style: TextStyle(
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w600,
                            fontSize: screenHeight * 0.022)))),
            Expanded(
                flex: 1,
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(45),
                        boxShadow: const [
                          BoxShadow(
                              blurRadius: 5,
                              color: Color.fromRGBO(0, 0, 0, 0.15),
                              offset: Offset(0, 5))
                        ]),
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(45)),
                        child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                if (globals
                                                        .order[index].count !=
                                                    1) {
                                                  globals.order[index].count--;
                                                  globals.russianOrder[index]
                                                      .count--;
                                                  globals.ukrainianOrder[index]
                                                      .count--;
                                                  widget.onSonChanged();
                                                } else {
                                                  globals.order.removeAt(index);
                                                  globals.russianOrder
                                                      .removeAt(index);
                                                  globals.ukrainianOrder
                                                      .removeAt(index);
                                                }
                                              });
                                            },
                                            child: const Icon(
                                                Icons.remove_circle,
                                                color: Color(0xFF3177FF))))),
                                Expanded(
                                    flex: 1,
                                    child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                            globals.order[index].count
                                                .toString(),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: 'SF Pro Display',
                                                fontWeight: FontWeight.w600,
                                                fontSize:
                                                    screenHeight * 0.023)))),
                                Expanded(
                                    flex: 1,
                                    child: Align(
                                        alignment: Alignment.centerRight,
                                        child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                globals.order[index].count++;
                                                globals.russianOrder[index]
                                                    .count++;
                                                globals.ukrainianOrder[index]
                                                    .count++;
                                                widget.onSonChanged();
                                              });
                                            },
                                            child: const Icon(Icons.add_circle,
                                                color: Color(0xFF3177FF)))))
                              ],
                            ))))),
            Expanded(
                flex: 1,
                child: Padding(
                    padding: EdgeInsets.only(left: screenWidth * 0.015),
                    child: Text(
                        '\$ ' +
                            (globals.order[index].count *
                                    globals.order[index].cost)
                                .toStringAsFixed(2),
                        style: TextStyle(
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w600,
                            fontSize: screenHeight * 0.022))))
          ],
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider();
      },
    );
  }
}
