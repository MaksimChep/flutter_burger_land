import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DetailsHead extends StatelessWidget {
  DetailsHead({Key? key}) : super(key: key);
  late double screenHeight;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    return Row(
      children: [
        const Spacer(flex: 1),
        GestureDetector(
          child: Row(
            children: [
              Image.asset('assets/images/arrow.png'),
              Text(
                '  Назад',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'SF Pro Text',
                    fontWeight: FontWeight.w600,
                    fontSize: screenHeight * 0.0188),
              ),
            ],
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        const Spacer(flex: 25)
      ],
    );
  }
}
