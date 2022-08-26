import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_burger_land/data/models/languages_entity.dart';
import 'package:flutter_burger_land/globals.dart' as globals;

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  late double screenHeight;
  late double screenWidth;
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFFE5E5E5),
      body: SafeArea(
          child: Column(
        children: [
          const Spacer(flex: 2),
          Row(
            children: [
              const Spacer(flex: 1),
              GestureDetector(
                child: Row(
                  children: [
                    Image.asset('assets/images/arrow.png', color: Colors.black),
                    Text(
                        globals.language == Languages.UKRAINIAN
                            ? '  Назад'
                            : globals.language == Languages.ENGLISH
                                ? '  Back'
                                : '  Назад',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'SF Pro Text',
                            fontWeight: FontWeight.w600,
                            fontSize: screenHeight * 0.0188)),
                  ],
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              const Spacer(flex: 25)
            ],
          ),
          const Spacer(flex: 10),
          Expanded(
              flex: 2,
              child: Text(
                  globals.language == Languages.UKRAINIAN
                      ? 'Оберіть мову'
                      : globals.language == Languages.ENGLISH
                          ? 'Сhoose a language'
                          : 'Выберите язык',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w700,
                      fontSize: screenHeight * 0.025,
                      color: Colors.black))),
          const Spacer(flex: 1),
          Expanded(
              flex: 7,
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                  child: CustomRadioButton(
                    enableShape: true,
                    horizontal: true,
                    elevation: 0,
                    unSelectedColor: Theme.of(context).canvasColor,
                    selectedColor: const Color(0xFF3177FF),
                    buttonLables: const [
                      '🇺🇦 Українська',
                      '🇷🇺 Русский',
                      '🇬🇧 English',
                    ],
                    buttonValues: [
                      Languages.UKRAINIAN,
                      Languages.RUSSIAN,
                      Languages.ENGLISH,
                    ],
                    defaultSelected: globals.language,
                    buttonTextStyle: ButtonTextStyle(
                        selectedColor: Colors.white,
                        unSelectedColor: Colors.black,
                        textStyle: TextStyle(fontSize: screenHeight * 0.022)),
                    radioButtonValue: (value) {
                      globals.language = value.toString();
                      setState(() {});
                    },
                  ))),
          const Spacer(flex: 16)
        ],
      )),
    );
  }
}
