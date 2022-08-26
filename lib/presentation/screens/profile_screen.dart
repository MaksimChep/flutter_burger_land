import 'package:flutter/material.dart';
import 'package:flutter_burger_land/globals.dart' as globals;
import 'package:flutter_burger_land/presentation/screens/info_screen.dart';
import 'package:flutter_burger_land/presentation/screens/log_in_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFFE5E5E5),
        body: SafeArea(child: Builder(
          builder: (context) {
            if (globals.userLogedIn) {
              return InfoScreen();
            } else {
              return LogInScreen(
                onSonChanged: (() {
                  setState(() {});
                }),
              );
            }
          },
        )));
  }
}
