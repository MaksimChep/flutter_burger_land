import 'package:flutter/material.dart';
import 'package:flutter_burger_land/data/models/location_entity.dart';
import 'package:flutter_burger_land/presentation/screens/profile_screen.dart';

// ignore: must_be_immutable
class HomeHead extends StatelessWidget {
  HomeHead({Key? key, required this.location}) : super(key: key);
  late double screenHeight;
  late double screenWidth;
  final UserLocation location;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        const Spacer(flex: 1),
        Expanded(
          flex: 6,
          child: Row(
            children: [
              Padding(
                  padding: EdgeInsets.only(right: screenWidth * 0.018),
                  child: Image.asset(
                    'assets/images/Location.png',
                    height: screenHeight * 0.04,
                    width: screenHeight * 0.034,
                  )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(location.country + ',',
                      style: TextStyle(
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w500,
                          fontSize: screenHeight * 0.025)),
                  Text(location.city,
                      style: TextStyle(
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w500,
                          fontSize: screenHeight * 0.0155))
                ],
              ),
            ],
          ),
        ),
        Expanded(
          flex: 6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Burger',
                  style: TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w500,
                      fontSize: screenHeight * 0.0366)),
              Text('Land',
                  style: TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w300,
                      fontSize: screenHeight * 0.0222))
            ],
          ),
        ),
        Expanded(
            flex: 5,
            child: Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProfileScreen()));
                    },
                    child: SizedBox(
                      height: screenHeight * 0.038,
                      width: screenWidth * 0.081,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(45)),
                            border: Border.all(color: Colors.black)),
                        child: Image.asset('assets/images/user_icon.png'),
                      ),
                    )))),
        const Spacer(flex: 1)
      ],
    );
  }
}
