import 'package:flutter/material.dart';
import 'package:flutter_burger_land/data/models/languages_entity.dart';
import 'package:flutter_burger_land/globals.dart' as globals;

typedef StringCallBack = void Function(String search);

// ignore: must_be_immutable
class HomeSearch extends StatelessWidget {
  HomeSearch({Key? key, required this.onSonChanged}) : super(key: key);
  late double screenHeight;
  late double screenWidth;
  final StringCallBack onSonChanged;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Padding(
        padding: EdgeInsets.only(
            left: screenWidth * 0.032, right: screenWidth * 0.032),
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(45),
                boxShadow: const [
                  BoxShadow(
                      blurRadius: 5,
                      color: Color.fromRGBO(0, 0, 0, 0.15),
                      offset: Offset(0, -5))
                ]),
            child: Container(
              height: screenHeight * 0.063,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(45)),
              child: TextField(
                onChanged: ((value) {
                  onSonChanged(value.toLowerCase());
                }),
                style: TextStyle(
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w500,
                  fontSize: screenHeight * 0.022,
                ),
                decoration: InputDecoration(
                    hintText: globals.language == Languages.UKRAINIAN
                        ? 'Пошук...'
                        : globals.language == Languages.ENGLISH
                            ? 'Search...'
                            : 'Поиск...',
                    hintStyle: TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w300,
                      fontSize: screenHeight * 0.022,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(45),
                        borderSide:
                            const BorderSide(color: Colors.black, width: 1))),
              ),
            )));
  }
}
