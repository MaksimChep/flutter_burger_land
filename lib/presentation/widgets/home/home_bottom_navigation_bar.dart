import 'package:flutter/material.dart';
import 'package:flutter_burger_land/data/models/languages_entity.dart';
import 'package:flutter_burger_land/presentation/screens/language_screen.dart';
import 'package:flutter_burger_land/presentation/screens/order_screen.dart';
import 'package:flutter_burger_land/globals.dart' as globals;

typedef VoidCallback = void Function();

// ignore: must_be_immutable
class HomeBottomNavigationBar extends StatelessWidget {
  HomeBottomNavigationBar({Key? key, required this.onSonChanged})
      : super(key: key);
  late double screenHeight;
  late double screenWidth;
  final VoidCallback onSonChanged;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        SizedBox(
            height: screenHeight * 0.097,
            width: MediaQuery.of(context).size.width),
        Positioned(
            bottom: 0,
            child: Container(
                height: screenHeight * 0.0744,
                width: MediaQuery.of(context).size.width,
                color: Colors.white)),
        Positioned(
          top: 0,
          left: screenWidth * 0.125,
          child: Column(
            children: [
              Image.asset('assets/images/Home.png',
                  height: screenHeight * 0.048,
                  width: screenWidth * 0.097,
                  fit: BoxFit.fill),
              Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.008),
                child: Text(
                    globals.language == Languages.UKRAINIAN
                        ? 'Головна'
                        : globals.language == Languages.ENGLISH
                            ? 'Main'
                            : 'Главная',
                    style: TextStyle(
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w700,
                        fontSize: screenHeight * 0.016)),
              )
            ],
          ),
        ),
        Positioned(
          top: 0,
          left: screenWidth * 0.437,
          child: GestureDetector(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OrderScreen()),
                    (route) => false);
              },
              child: Column(
                children: [
                  Image.asset('assets/images/shopper.png',
                      height: screenHeight * 0.048,
                      width: screenWidth * 0.097,
                      fit: BoxFit.fill,
                      color: Colors.grey),
                  Padding(
                    padding: EdgeInsets.only(top: screenHeight * 0.008),
                    child: Text(
                        globals.language == Languages.UKRAINIAN
                            ? 'Кошик'
                            : globals.language == Languages.ENGLISH
                                ? 'Сart'
                                : 'Корзина',
                        style: TextStyle(
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w700,
                            fontSize: screenHeight * 0.016,
                            color: Colors.grey)),
                  )
                ],
              )),
        ),
        Positioned(
          bottom: screenHeight * 0.026,
          right: screenWidth * 0.111,
          child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LanguageScreen()),
                ).then((value) => onSonChanged());
              },
              child: Image.asset(
                'assets/images/more_circle.png',
                height: screenHeight * 0.03,
                width: screenHeight * 0.03,
                fit: BoxFit.fill,
                color: Colors.grey,
              )),
        )
      ],
    );
  }
}
