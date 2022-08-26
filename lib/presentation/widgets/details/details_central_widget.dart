import 'package:flutter/material.dart';
import 'package:flutter_burger_land/data/models/food_entity.dart';
import 'package:marquee/marquee.dart';

typedef IntCallback = void Function(int count);

class DetailsCentral extends StatefulWidget {
  const DetailsCentral(
      {Key? key, required this.food, required this.onSonChanged})
      : super(key: key);
  final Food food;
  final IntCallback onSonChanged;
  @override
  State<DetailsCentral> createState() => _DetailsCentralState();
}

class _DetailsCentralState extends State<DetailsCentral> {
  late double screenHeight;
  late double screenWidth;
  int count = 1;
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        SizedBox(height: screenHeight * 0.272, width: screenWidth),
        Positioned(
          left: -(screenWidth * 0.3),
          child: Hero(
              tag: widget.food.name,
              child: Image.network(
                widget.food.image,
                height: screenHeight * 0.272,
                width: screenWidth * 0.676,
                fit: BoxFit.fill,
                filterQuality: FilterQuality.high,
              )),
        ),
        Positioned(
            top: screenHeight * 0.026,
            left: screenWidth * 0.383,
            child: SizedBox(
                width: screenWidth * 0.55,
                height: screenHeight * 0.05,
                child: Marquee(
                  text: widget.food.name,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w700,
                      fontSize: screenHeight * 0.044),
                  scrollAxis: Axis.horizontal,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  pauseAfterRound: const Duration(seconds: 1),
                  blankSpace: 100.0,
                  accelerationDuration: const Duration(seconds: 1),
                  accelerationCurve: Curves.linear,
                  decelerationDuration: const Duration(milliseconds: 500),
                  decelerationCurve: Curves.easeOut,
                ))),
        Positioned(
            top: screenHeight * 0.091,
            left: screenWidth * 0.397,
            child: SizedBox(
                width: screenWidth * 0.465,
                height: screenHeight * 0.1,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Text(widget.food.products,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w400,
                          fontSize: screenHeight * 0.021)),
                ))),
        Positioned(
          top: screenHeight * 0.21,
          left: screenWidth * 0.409,
          child: RichText(
              text: TextSpan(
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'SF Pro Display',
                  ),
                  children: [
                TextSpan(
                  text: widget.food.firstCost,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: screenHeight * 0.024,
                  ),
                ),
                TextSpan(
                  text: widget.food.secondCost,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: screenHeight * 0.02,
                  ),
                )
              ])),
        ),
        Positioned(
            top: screenHeight * 0.2,
            left: screenWidth * 0.616,
            child: Container(
                height: screenHeight * 0.048,
                width: screenWidth * 0.311,
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xFF98BBFF), Color(0xFFCBDDFF)]),
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
                                        if (count != 1) {
                                          count--;
                                        }
                                        widget.onSonChanged(count);
                                      });
                                    },
                                    child: const Icon(Icons.remove_circle,
                                        color: Color(0xFF3177FF))))),
                        Expanded(
                            flex: 1,
                            child: Align(
                                alignment: Alignment.center,
                                child: Text('$count',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'SF Pro Display',
                                        fontWeight: FontWeight.w600,
                                        fontSize: screenHeight * 0.023)))),
                        Expanded(
                            flex: 1,
                            child: Align(
                                alignment: Alignment.centerRight,
                                child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        count++;
                                        widget.onSonChanged(count);
                                      });
                                    },
                                    child: const Icon(Icons.add_circle,
                                        color: Color(0xFF3177FF)))))
                      ],
                    ))))
      ],
    );
  }
}
