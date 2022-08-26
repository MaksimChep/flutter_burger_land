import 'package:flutter/material.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter_burger_land/data/models/languages_entity.dart';
import 'package:flutter_burger_land/globals.dart' as globals;

typedef StringCallback = void Function(String category);

// ignore: must_be_immutable
class HomeSelect extends StatelessWidget {
  HomeSelect({Key? key, required this.onSonChanged}) : super(key: key);
  late double screenHeight;
  late double screenWidth;
  final StringCallback onSonChanged;

  List<String> ukrainianList = [
    '🍔 Бургери',
    '🍕 Піцца',
    '🌭 Сендвічі',
  ];

  List<String> russianList = [
    '🍔 Бургеры',
    '🍕 Пицца',
    '🌭 Сэндвичи',
  ];

  List<String> englishList = [
    '🍔 Burgers',
    '🍕 Pizza',
    '🌭 Sandwiches',
  ];

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Row(children: [
          const Spacer(
            flex: 1,
          ),
          Expanded(
              flex: 4,
              child: Text(
                  globals.language == Languages.UKRAINIAN
                      ? 'КАТЕГОРІЇ'
                      : globals.language == Languages.ENGLISH
                          ? 'CATEGORIES'
                          : 'КАТЕГОРИИ',
                  style: TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w700,
                      fontSize: screenHeight * 0.018,
                      color: const Color(0xFFA4A4A4)))),
          const Spacer(flex: 11)
        ]),
        Padding(
            padding: EdgeInsets.only(
                left: screenWidth * 0.02,
                right: screenWidth * 0.02,
                top: screenHeight * 0.007),
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
                    child: Container(
                        margin: const EdgeInsets.all(3),
                        child: Center(
                          child: CustomRadioButton(
                            height: screenHeight * 0.0455,
                            enableShape: true,
                            elevation: 0,
                            autoWidth: true,
                            unSelectedColor: Theme.of(context).canvasColor,
                            selectedColor: const Color(0xFF3177FF),
                            defaultSelected: globals.selectedCategory,
                            buttonLables:
                                globals.language == Languages.UKRAINIAN
                                    ? ukrainianList
                                    : globals.language == Languages.ENGLISH
                                        ? englishList
                                        : russianList,
                            buttonValues: const [
                              'Бургеры',
                              'Пицца',
                              'Сэндвичи',
                            ],
                            buttonTextStyle: ButtonTextStyle(
                                selectedColor: Colors.white,
                                unSelectedColor: Colors.black,
                                textStyle: TextStyle(
                                  fontFamily: 'SF Pro Display',
                                  fontWeight: FontWeight.w600,
                                  fontSize: screenHeight * 0.0166,
                                )),
                            radioButtonValue: (value) {
                              globals.selectedCategory = value.toString();
                              onSonChanged(value.toString());
                            },
                          ),
                        )))))
      ],
    );
  }
}
