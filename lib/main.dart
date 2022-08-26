import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_burger_land/application.dart';
import 'package:flutter_burger_land/di/injector.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp(
      name: "dev project",
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  setUp();
  runApp(const Application());
}
