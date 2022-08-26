import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: const Color(0xFFE5E5E5),
        body: SafeArea(
          child: Stack(children: [
            SizedBox(height: screenHeight, width: screenWidth),
            Positioned(
              top: screenHeight * 0.286,
              left: screenWidth * 0.148,
              child: Container(
                  height: screenHeight * 0.333,
                  width: screenHeight * 0.333,
                  decoration: const BoxDecoration(
                    color: Color(0xFFBCBCBC),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Container(
                        height: screenHeight * 0.28,
                        width: screenHeight * 0.28,
                        decoration: const BoxDecoration(
                            color: Color(0xFFE5E5E5), shape: BoxShape.circle),
                        child: Center(
                            child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                    style: const TextStyle(
                                        fontFamily: 'SF Pro Display',
                                        color: Colors.black),
                                    children: [
                                      TextSpan(
                                          text: 'Burger\n',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: screenHeight * 0.055)),
                                      TextSpan(
                                          text: 'Land',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: screenHeight * 0.035))
                                    ])))),
                  )),
            ),
            Positioned(
                top: screenHeight * 0.298,
                left: screenWidth * 0.175,
                child: SizedBox(
                  height: screenHeight * 0.31,
                  width: screenHeight * 0.31,
                  child: CircularProgressIndicator(
                    color: const Color(0xFF5087F1),
                    strokeWidth: screenHeight * 0.03,
                  ),
                ))
          ]),
        ));
  }
}
