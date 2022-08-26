import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_burger_land/data/models/languages_entity.dart';
import 'package:flutter_burger_land/globals.dart' as globals;
import 'package:flutter_burger_land/presentation/providers/auth_provider.dart';
import 'package:flutter_burger_land/presentation/providers/user_data_provider.dart';
import 'package:flutter_burger_land/presentation/screens/register_screen.dart';
import 'package:flutter_burger_land/presentation/widgets/profile/profile_input_widget.dart';
import 'package:provider/provider.dart';

typedef VoidCallback = Function();

// ignore: must_be_immutable
class LogInScreen extends StatelessWidget {
  LogInScreen({Key? key, required this.onSonChanged}) : super(key: key);

  String email = "";
  String password = "";
  final VoidCallback onSonChanged;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        const Spacer(flex: 1),
        Row(
          children: [
            const Spacer(flex: 1),
            GestureDetector(
              child: Row(
                children: [
                  Image.asset('assets/images/arrow.png', color: Colors.black),
                  Text(
                      globals.language == Languages.UKRAINIAN
                          ? '  Назад'
                          : globals.language == Languages.ENGLISH
                              ? '  Back'
                              : '  Назад',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'SF Pro Text',
                          fontWeight: FontWeight.w600,
                          fontSize: screenHeight * 0.0188)),
                ],
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const Spacer(flex: 25)
          ],
        ),
        const Spacer(flex: 3),
        Expanded(
            flex: 1,
            child: Text(
                globals.language == Languages.UKRAINIAN
                    ? 'Увійти'
                    : globals.language == Languages.ENGLISH
                        ? 'Sign in'
                        : 'Войти',
                style: TextStyle(
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w700,
                    fontSize: screenHeight * 0.03))),
        const Spacer(flex: 1),
        Expanded(
            flex: 2,
            child: ProfileInput(
              hint: globals.language == Languages.UKRAINIAN
                  ? 'Ел. пошта'
                  : globals.language == Languages.ENGLISH
                      ? 'Email'
                      : 'Эл. почта',
              onSonChanged: (value) {
                email = value;
              },
            )),
        const Spacer(flex: 1),
        Expanded(
            flex: 2,
            child: ProfileInput(
              hint: globals.language == Languages.UKRAINIAN
                  ? 'Пароль'
                  : globals.language == Languages.ENGLISH
                      ? 'Password'
                      : 'Пароль',
              onSonChanged: (value) {
                password = value;
              },
            )),
        const Spacer(flex: 1),
        Expanded(
            flex: 1,
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(45),
                    boxShadow: const [
                      BoxShadow(
                          blurRadius: 5,
                          color: Color.fromRGBO(0, 0, 0, 0.15),
                          offset: Offset(0, 5))
                    ]),
                child: GestureDetector(
                    onTap: () async {
                      final authProvider =
                          Provider.of<AuthProvider>(context, listen: false);

                      authProvider
                          .signInWithEmailAndPassword(email, password)
                          .then((value) async {
                        if (authProvider.errorMessage == "") {
                          String uid = authProvider.uid;
                          final userProvider = Provider.of<UserDataProvider>(
                              context,
                              listen: false);
                          globals.email = email;

                          userProvider.getUserData(uid).then(((value) {
                            globals.currentUser = userProvider.userData;
                            globals.userLogedIn = true;
                            onSonChanged();
                          }));
                        } else {
                          await showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                  title: Text(authProvider.errorMessage))).then(
                              (value) => authProvider.resetErrorMessage());
                        }
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(45),
                          color: const Color(0xFF3177FF)),
                      height: screenHeight * 0.0388,
                      width: screenWidth * 0.576,
                      child: Align(
                          alignment: Alignment.center,
                          child: Text(
                              globals.language == Languages.UKRAINIAN
                                  ? 'Авторизуватися'
                                  : globals.language == Languages.ENGLISH
                                      ? 'Log in'
                                      : 'Авторизоваться',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'SF Pro Display',
                                  fontWeight: FontWeight.w500,
                                  fontSize: screenHeight * 0.022))),
                    )))),
        const Spacer(flex: 1),
        Expanded(
            flex: 1,
            child: RichText(
              text: TextSpan(
                  style: TextStyle(
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w500,
                    fontSize: screenHeight * 0.02,
                  ),
                  children: [
                    TextSpan(
                      text: globals.language == Languages.UKRAINIAN
                          ? 'Немає акаунту? '
                          : globals.language == Languages.ENGLISH
                              ? 'No account? '
                              : 'Нет аккаунта? ',
                      style: const TextStyle(color: Colors.black),
                    ),
                    TextSpan(
                        text: globals.language == Languages.UKRAINIAN
                            ? 'Створити'
                            : globals.language == Languages.ENGLISH
                                ? 'Create'
                                : 'Создвть',
                        style: const TextStyle(
                            decoration: TextDecoration.underline,
                            color: Color(0xFF1A73E8)),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterScreen()));
                          })
                  ]),
            )),
        const Spacer(
          flex: 10,
        )
      ],
    );
  }
}
