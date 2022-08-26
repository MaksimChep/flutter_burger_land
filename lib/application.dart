import 'package:flutter/material.dart';
import 'package:flutter_burger_land/presentation/providers/auth_provider.dart';
import 'package:flutter_burger_land/presentation/providers/food_provider.dart';
import 'package:flutter_burger_land/presentation/providers/location_provider.dart';
import 'package:flutter_burger_land/presentation/providers/order_provider.dart';
import 'package:flutter_burger_land/presentation/providers/user_data_provider.dart';
import 'package:flutter_burger_land/presentation/screens/home_screen.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => GetIt.I<FoodProvider>()
              ..getFood('burgers')
              ..getFood('pizza')
              ..getFood('sandwiches')),
        ChangeNotifierProvider(
            create: ((context) => GetIt.I<LocationProvider>()..getLocation())),
        ChangeNotifierProvider(
            create: (context) => GetIt.I<UserDataProvider>()),
        ChangeNotifierProvider(create: ((context) => GetIt.I<AuthProvider>())),
        ChangeNotifierProvider(create: ((context) => GetIt.I<OrderProvider>()))
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
