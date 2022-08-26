import 'package:flutter/material.dart';
import 'package:flutter_burger_land/data/models/languages_entity.dart';
import 'package:flutter_burger_land/data/models/user_data_entity.dart';
import 'package:flutter_burger_land/presentation/providers/auth_provider.dart';
import 'package:flutter_burger_land/presentation/providers/user_data_provider.dart';
import 'package:flutter_burger_land/presentation/widgets/profile/profile_input_widget.dart';
import 'package:provider/provider.dart';
import 'package:flutter_burger_land/globals.dart' as globals;

// ignore: must_be_immutable
class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  final List<String> _russianHints = [
    'Эл. почта',
    'Номер телефона',
    'Имя',
    'Фамилия',
    'Город',
    'Адрес',
    'Пароль',
    'Повторите пароль'
  ];
  final List<String> _ukrainianHints = [
    'Ел. пошта',
    'Номер телефону',
    'Ім\'я',
    'Прізвище',
    'Місто',
    'Адреса',
    'Пароль',
    'Повторіть пароль'
  ];
  final List<String> _englishHints = [
    'Email',
    'Phone number',
    'Name',
    'Surname',
    'City/town',
    'Address',
    'Password',
    'Repeat password'
  ];

  List<String> registerData = List.generate(8, (index) => "");

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFFE5E5E5),
        body: SafeArea(
            child: Column(
          children: [
            const Spacer(flex: 1),
            Row(
              children: [
                const Spacer(flex: 1),
                GestureDetector(
                  child: Row(
                    children: [
                      Image.asset('assets/images/arrow.png',
                          color: Colors.black),
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
            const Spacer(flex: 2),
            Expanded(
                flex: 1,
                child: Text(
                    globals.language == Languages.UKRAINIAN
                        ? 'Регістрація'
                        : globals.language == Languages.ENGLISH
                            ? 'Registration'
                            : 'Регистрация',
                    style: TextStyle(
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w700,
                        fontSize: screenHeight * 0.03))),
            Expanded(
                flex: 10,
                child: ListView.builder(
                    itemCount: _ukrainianHints.length,
                    itemBuilder: (context, index) {
                      return (ProfileInput(
                          hint: globals.language == Languages.UKRAINIAN
                              ? _ukrainianHints[index]
                              : globals.language == Languages.ENGLISH
                                  ? _englishHints[index]
                                  : _russianHints[index],
                          onSonChanged: (value) {
                            registerData[index] = value;
                          }));
                    })),
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
                        onTap: (() async {
                          bool isCorrect = true;
                          for (var element in registerData) {
                            if (element == "") {
                              isCorrect = false;
                            }
                          }
                          if (!isCorrect) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(globals.language ==
                                        Languages.UKRAINIAN
                                    ? 'Всі поля повинні бути заповнені!'
                                    : globals.language == Languages.ENGLISH
                                        ? 'All fields must be filled in!'
                                        : 'Все поля должны быть заполнены!')));
                          }
                          if (registerData[6] != registerData[7]) {
                            isCorrect = false;
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content:
                                    Text(globals.language == Languages.UKRAINIAN
                                        ? 'Паролі не співпадають!'
                                        : globals.language == Languages.ENGLISH
                                            ? 'Passwords do not match!'
                                            : 'Пароли не совпадают!')));
                          }
                          if (RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(registerData[0])) {
                            isCorrect = false;
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content:
                                    Text(globals.language == Languages.UKRAINIAN
                                        ? 'Ел. пошта не валідна!'
                                        : globals.language == Languages.ENGLISH
                                            ? 'Email is not valid!'
                                            : 'Эл. почта не валидна!')));
                          }
                          if (isCorrect) {
                            final authProvider =
                                Provider.of<AuthProvider>(context);
                            authProvider
                                .createUserWithEmailAndPasswordAndSignIn(
                                    registerData[0], registerData[6])
                                .then((value) {
                              String uid = authProvider.uid;
                              UserData user = UserData(
                                  phoneNumber: registerData[1],
                                  name: registerData[2],
                                  surname: registerData[3],
                                  city: registerData[4],
                                  adress: registerData[5]);
                              final userProvider =
                                  Provider.of<UserDataProvider>(context,
                                      listen: false);
                              globals.email = registerData[0];
                              globals.userLogedIn = true;
                              userProvider.addUserData(user, uid);
                            });
                          }
                        }),
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
                                        ? 'Зареєструватися'
                                        : globals.language == Languages.ENGLISH
                                            ? 'Register'
                                            : 'Зарегистрироваться',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'SF Pro Display',
                                        fontWeight: FontWeight.w500,
                                        fontSize: screenHeight * 0.022))))))),
            const Spacer(flex: 5)
          ],
        )));
  }
}
