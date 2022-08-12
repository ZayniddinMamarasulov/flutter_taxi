import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_taxi/screens/sign_in_screen.dart';
import 'package:flutter_taxi/utils/colors.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isObscureText = true;

  final nameController = TextEditingController();
  final numberController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    numberController.dispose();
    passwordController.dispose();
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
                  "Регистраация",
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
              buildTextField('ИМЯ', nameController),
              buildTextField('номер телефона'.toUpperCase(), numberController),
              buildTextField('ПАРОЛЬ', passwordController),
              const SizedBox(height: 36),
              InkWell(
                onTap: () {
                  if (passwordController.text.isNotEmpty &&
                      numberController.text.isNotEmpty &&
                      nameController.text.isNotEmpty) {
                    String number = numberController.text;
                    Navigator.pushNamed(context, 'verify',
                        arguments: {'number': number});
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
                    "Зарегистрироваться",
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
              const SizedBox(height: 188),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Уже есть учетная запись?",
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignInScreen()));
                    },
                    child: const Text(
                      "Войти",
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
            padding:
                const EdgeInsets.symmetric(horizontal: 12).copyWith(right: 8),
            height: 44,
            width: MediaQuery.of(context).size.width * 303 / 375,
            decoration: BoxDecoration(
              color: textFieldBackgroundColor,
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              border: Border.all(color: textFieldBorderColor, width: 0.5),
            ),
            child: text == 'ПАРОЛЬ'
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
                          size: 20,
                        ),
                      ),
                    ),
                  )
                : TextField(
                    controller: controller,
                    textInputAction: TextInputAction.next,
                    keyboardType: text == 'номер телефона'
                        ? TextInputType.number
                        : TextInputType.text,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
