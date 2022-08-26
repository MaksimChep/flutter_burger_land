import 'package:flutter/material.dart';
import 'package:flutter_burger_land/data/models/languages_entity.dart';
import 'package:flutter_burger_land/globals.dart' as globals;

// ignore: must_be_immutable
class DetailsDescription extends StatelessWidget {
  DetailsDescription({Key? key, required this.description}) : super(key: key);
  late double screenHeight;
  late double screenWidth;
  final String description;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Padding(
        padding: EdgeInsets.only(left: screenWidth * 0.062),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                globals.language == Languages.UKRAINIAN
                    ? 'ОПИС'
                    : globals.language == Languages.ENGLISH
                        ? 'DESCRIPTION'
                        : 'ОПИСАНИЕ',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w700,
                    fontSize: screenHeight * 0.026)),
            SizedBox(
                width: screenWidth * 0.783,
                height: screenHeight * 0.17,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Text(description,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w400,
                          fontSize: screenHeight * 0.022)),
                ))
          ],
        ));
  }
}
