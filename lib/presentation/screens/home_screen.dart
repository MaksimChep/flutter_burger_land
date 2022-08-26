import 'package:flutter/material.dart';
import 'package:flutter_burger_land/presentation/providers/food_provider.dart';
import 'package:flutter_burger_land/presentation/providers/location_provider.dart';
import 'package:flutter_burger_land/presentation/screens/loading_screen.dart';
import 'package:flutter_burger_land/presentation/widgets/home/home_widgets.dart';
import 'package:provider/provider.dart';
import 'package:flutter_burger_land/globals.dart' as globals;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late FoodProvider food;
  late LocationProvider location;

  String searchValue = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    food = context.watch<FoodProvider>();
    location = context.watch<LocationProvider>();
    return Builder(
      builder: (context) {
        //if (location.location.country != '' &&
        //    food.ukrainianBurgers.isNotEmpty) {
        return Scaffold(
            backgroundColor: const Color(0xFFE5E5E5),
            resizeToAvoidBottomInset: false,
            body: SafeArea(
              child: Column(
                children: [
                  Expanded(
                      flex: 6,
                      child: HomeHead(
                        location: location.location,
                      )),
                  const Spacer(flex: 1),
                  Expanded(
                      flex: 4,
                      child: HomeSearch(
                        onSonChanged: ((search) {
                          setState(() {
                            searchValue = search;
                          });
                        }),
                      )),
                  const Spacer(flex: 1),
                  Expanded(
                      flex: 6,
                      child: HomeSelect(
                        onSonChanged: (String newCategory) {
                          setState(() {
                            switch (newCategory) {
                              case 'Бургеры':
                                globals.ukrainianListFood =
                                    food.ukrainianBurgers;
                                globals.listFood = food.burgers;
                                globals.russianListFood = food.russianBurgers;
                                break;
                              case 'Пицца':
                                globals.ukrainianListFood = food.ukrainianPizza;
                                globals.listFood = food.pizza;
                                globals.russianListFood = food.russianPizza;
                                break;
                              case 'Сэндвичи':
                                globals.ukrainianListFood =
                                    food.ukrainianSandwiches;
                                globals.listFood = food.sandwiches;
                                globals.russianListFood =
                                    food.russianSandwiches;
                                break;
                            }
                          });
                        },
                      )),
                  const Spacer(flex: 1),
                  Expanded(
                      flex: 40,
                      child: HomeFoodList(
                          searchFilter: searchValue,
                          foodList: globals.listFood.isEmpty
                              ? globals.listFood = food.burgers
                              : globals.listFood,
                          ukrainianFoodList: globals.ukrainianListFood.isEmpty
                              ? globals.ukrainianListFood =
                                  food.ukrainianBurgers
                              : globals.ukrainianListFood,
                          russianFoodList: globals.russianListFood.isEmpty
                              ? globals.russianListFood = food.russianBurgers
                              : globals.russianListFood)),
                ],
              ),
            ),
            bottomNavigationBar: HomeBottomNavigationBar(
              onSonChanged: () {
                setState(() {});
              },
            ));
        // } else {
        //    return const LoadingScreen();
        //  }
      },
    );
  }
}
