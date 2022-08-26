import 'package:flutter/material.dart';
import 'package:flutter_burger_land/data/models/food_entity.dart';
import 'package:flutter_burger_land/data/models/languages_entity.dart';
import 'package:flutter_burger_land/presentation/screens/details_screen.dart';
import 'package:flutter_burger_land/globals.dart' as globals;
import 'package:marquee/marquee.dart';

class HomeFoodList extends StatefulWidget {
  const HomeFoodList(
      {Key? key,
      required this.foodList,
      required this.ukrainianFoodList,
      required this.russianFoodList,
      required this.searchFilter})
      : super(key: key);
  final List<Food> foodList;
  final List<Food> ukrainianFoodList;
  final List<Food> russianFoodList;
  final String searchFilter;
  @override
  State<HomeFoodList> createState() => _HomeFoodListState();
}

class _HomeFoodListState extends State<HomeFoodList> {
  late double screenHeight;
  late double screenWidth;
  List<Food> filtredList = List.empty(growable: true);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Builder(builder: ((context) {
      {
        filtredList.clear();
        for (var element in globals.language == Languages.UKRAINIAN
            ? widget.ukrainianFoodList
            : globals.language == Languages.ENGLISH
                ? widget.foodList
                : widget.russianFoodList) {
          if (element.name.toLowerCase().contains(widget.searchFilter)) {
            filtredList.add(element);
          }
        }

        return Column(
          children: [
            Padding(
                padding: EdgeInsets.only(bottom: screenHeight * 0.011),
                child: Row(children: [
                  const Spacer(
                    flex: 1,
                  ),
                  Expanded(
                      flex: 3,
                      child: Text(
                          globals.language == Languages.UKRAINIAN
                              ? 'МЕНЮ'
                              : globals.language == Languages.ENGLISH
                                  ? 'MENU'
                                  : 'МЕНЮ',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontFamily: 'SF Pro Display',
                              fontWeight: FontWeight.w700,
                              fontSize: screenHeight * 0.02,
                              color: const Color(0xFFA4A4A4)))),
                  const Spacer(flex: 12)
                ])),
            SizedBox(
                height: screenHeight * 0.49,
                child: Padding(
                    padding: EdgeInsets.only(left: screenWidth * 0.027),
                    child: GridView.count(
                      // crossAxisCount is the number of columns
                      crossAxisCount: 2,
                      // This creates two columns with two items in each column
                      children: List.generate(filtredList.length, (index) {
                        return Stack(
                          children: [
                            SizedBox(
                              height: screenHeight * 0.264,
                              width: screenWidth * 0.439,
                            ),
                            Positioned(
                                bottom: 0,
                                child: Container(
                                  height: screenHeight * 0.228,
                                  width: screenWidth * 0.439,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(19),
                                      color: Colors.white),
                                )),
                            Positioned(
                              top: 0,
                              left: screenWidth * 0.067,
                              child: Hero(
                                  tag: filtredList[index].name,
                                  child: Image.network(
                                    filtredList[index].image,
                                    width: screenWidth * 0.279,
                                    height: screenHeight * 0.107,
                                    loadingBuilder:
                                        (context, child, loadingProgress) {
                                      if (loadingProgress == null) {
                                        return child;
                                      }

                                      return SizedBox(
                                        height: screenHeight * 0.088,
                                        width: screenHeight * 0.088,
                                        child: const Align(
                                            alignment: Alignment.centerRight,
                                            child: CircularProgressIndicator()),
                                      );
                                    },
                                  )),
                            ),
                            Positioned(
                                top: screenHeight * 0.115,
                                left: screenWidth * 0.044,
                                child: SizedBox(
                                    width: screenWidth * 0.34,
                                    height: screenHeight * 0.03,
                                    child: Marquee(
                                      text: filtredList[index].name,
                                      style: TextStyle(
                                        fontFamily: 'SF Pro Display',
                                        fontWeight: FontWeight.w600,
                                        fontSize: screenHeight * 0.022,
                                      ),
                                      scrollAxis: Axis.horizontal,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      pauseAfterRound:
                                          const Duration(seconds: 1),
                                      blankSpace: 100.0,
                                      accelerationDuration:
                                          const Duration(seconds: 1),
                                      accelerationCurve: Curves.linear,
                                      decelerationDuration:
                                          const Duration(milliseconds: 500),
                                      decelerationCurve: Curves.easeOut,
                                    ))),
                            Positioned(
                                top: screenHeight * 0.145,
                                child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: screenWidth * 0.046),
                                    child: SizedBox(
                                        width: screenWidth * 0.35,
                                        height: screenHeight * 0.05,
                                        child: SingleChildScrollView(
                                            scrollDirection: Axis.vertical,
                                            child: Text(
                                              filtredList[index].products,
                                              style: TextStyle(
                                                fontFamily: 'SF Pro Display',
                                                fontWeight: FontWeight.w400,
                                                fontSize: screenHeight * 0.015,
                                              ),
                                            ))))),
                            Positioned(
                              bottom: screenHeight * 0.0166,
                              left: screenWidth * 0.046,
                              child: RichText(
                                  text: TextSpan(
                                      style: const TextStyle(
                                        color: Color(0xFF3177FF),
                                        fontFamily: 'SF Pro Display',
                                      ),
                                      children: [
                                    TextSpan(
                                      text: filtredList[index].firstCost,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: screenHeight * 0.017,
                                      ),
                                    ),
                                    TextSpan(
                                      text: filtredList[index].secondCost,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: screenHeight * 0.013,
                                      ),
                                    )
                                  ])),
                            ),
                            Positioned(
                                right: screenWidth * 0.07,
                                bottom: screenHeight * 0.0166,
                                child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => DetailsScreen(
                                                  food: widget.foodList[
                                                      getEnglishIndex(
                                                          filtredList[index]
                                                              .image)],
                                                  ukrainianFood:
                                                      widget.ukrainianFoodList[
                                                          getUkrainianIndex(
                                                              filtredList[index]
                                                                  .image)],
                                                  russianFood:
                                                      widget.russianFoodList[
                                                          getRussianIndex(
                                                              filtredList[index]
                                                                  .image)],
                                                )),
                                      );
                                    },
                                    child: Icon(Icons.add_circle,
                                        size: screenHeight * 0.0316,
                                        color: const Color(0xFF3177FF))))
                          ],
                        );
                      }),
                    )))
          ],
        );
      }
    }));
  }

  int getRussianIndex(String image) {
    for (int index = 0; index < widget.russianFoodList.length; index++) {
      if (widget.russianFoodList[index].image == image) {
        return index;
      }
    }
    return 0;
  }

  int getUkrainianIndex(String image) {
    for (int index = 0; index < widget.ukrainianFoodList.length; index++) {
      if (widget.ukrainianFoodList[index].image == image) {
        return index;
      }
    }
    return 0;
  }

  int getEnglishIndex(String image) {
    for (int index = 0; index < widget.foodList.length; index++) {
      if (widget.foodList[index].image == image) {
        return index;
      }
    }
    return 0;
  }
}
