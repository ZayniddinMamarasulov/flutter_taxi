import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/colors.dart';
import 'home_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isObscureText = true;
  final passwordController = TextEditingController();
  final numberController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    passwordController.dispose();
    numberController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 20,
                width: 237,
                margin: const EdgeInsets.only(top: 35),
                child: const Text(
                  "Вход",
                  style: TextStyle(
                    color: Color(0xff3E4958),
                    fontSize: 20,
                    fontFamily: "PT Sans",
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 153),
              buildTextField('номер телефона'.toUpperCase(), numberController),
              buildTextField('ПАРОЛЬ', passwordController, isPassword: true),
              const SizedBox(height: 36),
              InkWell(
                onTap: () {
                  if (passwordController.text.isNotEmpty &&
                      numberController.text.isNotEmpty) {
                    saveLogin();

                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                        (route) => false);
                  }
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 22),
                  height: 60,
                  width: MediaQuery.of(context).size.width * 303 / 375,
                  decoration: BoxDecoration(
                    color: const Color(0xff7EAB3A),
                    border:
                        Border.all(color: const Color(0xffD5DDE0), width: 0.5),
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                  ),
                  child: const Text(
                    "Войти",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontStyle: FontStyle.normal,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w700,
                        fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      margin: const EdgeInsets.only(right: 9),
                      width: 59,
                      child: const Divider(
                        height: 2,
                        color: Color(0xffD5DDE0),
                      )),
                  const SizedBox(
                    height: 20,
                    width: 167,
                    child: Center(
                        child: Text(
                      'Или Войдите С помощью',
                      style: TextStyle(
                        color: Color(0xff3E4958),
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        fontFamily: "PT Sans",
                      ),
                    )),
                  ),
                  Container(
                      margin: const EdgeInsets.only(left: 9),
                      width: 59,
                      child: const Divider(
                        height: 2,
                        color: Color(0xffD5DDE0),
                      )),
                ],
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 90),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/ic_facebook.png',
                      width: 50,
                      height: 50,
                    ),
                    Image.asset(
                      'assets/ic_twitter.png',
                      width: 50,
                      height: 50,
                    ),
                    Image.asset(
                      'assets/ic_gmail.png',
                      width: 50,
                      height: 50,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 125),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Нет учетной записи? ",
                    style: TextStyle(
                      color: Color(0xff97ADB6),
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Inter",
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  const SizedBox(width: 6),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Регистрация",
                      style: TextStyle(
                        color: Color(0xff7EAB3A),
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Inter",
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  Padding buildTextField(String text, controller, {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 40),
            height: 20,
            width: 256,
            child: Text(
              text,
              style: const TextStyle(color: Color(0xff3E4958), fontSize: 13),
            ),
          ),
          const SizedBox(height: 7),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 36),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            height: 44,
            width: MediaQuery.of(context).size.width * 303 / 375,
            decoration: BoxDecoration(
              color: textFieldBackgroundColor,
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              border: Border.all(color: textFieldBorderColor, width: 0.5),
            ),
            child: isPassword
                ? TextField(
                    controller: controller,
                    obscureText: isObscureText,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            isObscureText = !isObscureText;
                          });
                        },
                        child: Icon(
                          isObscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: const Color(0xff97ADB6),
                        ),
                      ),
                    ),
                  )
                : TextField(
                    controller: controller,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  void saveLogin() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLogIn', true);
  }
}
