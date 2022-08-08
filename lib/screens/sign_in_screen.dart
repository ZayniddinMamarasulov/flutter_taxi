import 'package:flutter/material.dart';
import 'package:flutter_taxi/screens/sign_up_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isObscureText = true;
  final passwordController = TextEditingController();
  final gmailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF7F8F9),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 20 / 812,
                width: MediaQuery.of(context).size.width * 237 / 375,
                margin: const EdgeInsets.only(top: 35),
                child: Text(
                  "Вход",
                  style: TextStyle(
                    color: const Color(0xff3E4958),
                    fontSize: 18,
                    fontFamily: "PT Sans",
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 153 / 812),
              buildTextField('ЭЛЕКТРОННАЯ ПОЧТА', gmailController),
              buildTextField('ПАРОЛЬ', passwordController, isPassword: true),
              SizedBox(height: MediaQuery.of(context).size.height * 36 / 812),
              InkWell(
                onTap: () {
                  saveLogin();
                  if (passwordController.text.isNotEmpty &&
                      gmailController.text.isNotEmpty) {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => HomePage()),
                        (Route<dynamic> route) => false);
                  }
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 22 / 812),
                  height: MediaQuery.of(context).size.height * 60 / 812,
                  width: MediaQuery.of(context).size.width * 303 / 375,
                  decoration: BoxDecoration(
                    color: const Color(0xff7EAB3A),
                    border:
                        Border.all(color: const Color(0xffD5DDE0), width: 0.5),
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Text(
                    "Войти",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontStyle: FontStyle.normal,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w700,
                        fontSize:
                            MediaQuery.of(context).size.height * 16 / 812),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 50 / 812),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      margin: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width * 9 / 375),
                      width: MediaQuery.of(context).size.width * 59 / 375,
                      child: const Divider(
                        height: 2,
                        color: Color(0xffD5DDE0),
                      )),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 167 / 375,
                    height: MediaQuery.of(context).size.height * 20 / 812,
                    child: Center(
                        child: Text(
                      'Или Войдите С помощью',
                      style: TextStyle(
                        color: const Color(0xff3E4958),
                        fontSize: MediaQuery.of(context).size.height * 13 / 812,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        fontFamily: "PT Sans",
                      ),
                    )),
                  ),
                  Container(
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 9 / 375),
                      width: MediaQuery.of(context).size.width * 59 / 375,
                      child: const Divider(
                        height: 2,
                        color: Color(0xffD5DDE0),
                      )),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 30 / 812),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 90 / 375),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/ic_facebook.png',
                      width: MediaQuery.of(context).size.width * 50 / 375,
                      height: 50,
                    ),
                    Image.asset(
                      'assets/ic_twitter.png',
                      width: MediaQuery.of(context).size.width * 50 / 375,
                      height: 50,
                    ),
                    Image.asset(
                      'assets/ic_gmail.png',
                      width: MediaQuery.of(context).size.width * 50 / 375,
                      height: 50,
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 125 / 812),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Нет учетной записи? ",
                    style: TextStyle(
                      color: const Color(0xff97ADB6),
                      fontSize: MediaQuery.of(context).size.height * 15 / 812,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Inter",
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 6 / 375),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpScreen()));
                    },
                    child: Text(
                      "Регистрация",
                      style: TextStyle(
                        color: const Color(0xff7EAB3A),
                        fontSize: MediaQuery.of(context).size.height * 15 / 812,
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
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height * 16 / 812,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 40 / 375),
            height: MediaQuery.of(context).size.height * 20 / 812,
            width: MediaQuery.of(context).size.width * 256 / 375,
            child: Text(
              text,
              style: const TextStyle(color: Color(0xff3E4958), fontSize: 13),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 7 / 812),
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 36 / 375),
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 12 / 375),
            height: MediaQuery.of(context).size.height * 44 / 812,
            width: MediaQuery.of(context).size.width * 303 / 375,
            decoration: BoxDecoration(
              color: const Color(0x40D5DDE0),
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              border: Border.all(color: const Color(0xffD5DDE0), width: 0.5),
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
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  void saveLogin()async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("isLogIn", true);
  }
}
