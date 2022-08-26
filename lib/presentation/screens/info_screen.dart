import 'package:flutter/material.dart';
import 'package:flutter_burger_land/data/models/languages_entity.dart';
import 'package:flutter_burger_land/globals.dart' as globals;

// ignore: must_be_immutable
class InfoScreen extends StatelessWidget {
  InfoScreen({Key? key}) : super(key: key);
  final List<String> _headerList = [
    'Имя: ',
    'Фамилия: ',
    'Эл. почта: ',
    'Номер телефона: ',
    'Город: ',
    'Адрес: '
  ];
  final List<String> _infoList = [
    globals.currentUser.name,
    globals.currentUser.surname,
    globals.email,
    globals.currentUser.phoneNumber,
    globals.currentUser.city,
    globals.currentUser.adress
  ];
  late double screenHeight;
  late double screenWidth;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Column(children: [
      const Spacer(flex: 1),
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
      const Spacer(flex: 3),
      Expanded(
          flex: 1,
          child: Text(
              globals.language == Languages.UKRAINIAN
                  ? 'Профіль'
                  : globals.language == Languages.ENGLISH
                      ? 'Profile'
                      : 'Профиль',
              style: TextStyle(
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w700,
                  fontSize: screenHeight * 0.03))),
      const Spacer(flex: 1),
      Expanded(
          flex: 10,
          child: ListView.separated(
              itemBuilder: (context, index) {
                return Text(_headerList[index] + _infoList[index]);
              },
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemCount: _infoList.length)),
      const Spacer(flex: 10)
    ]);
  }
}
