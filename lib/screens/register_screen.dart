import 'package:flutter/material.dart';
import 'package:flutter_taxi/components/appBar.dart';
import 'package:flutter_taxi/screens/login_screen.dart';
import 'package:flutter_taxi/screens/verify_screen.dart';
import 'package:flutter_taxi/widgets/bottom_text_button.dart';
import 'package:flutter_taxi/widgets/rounded_button.dart';
import 'package:flutter_taxi/widgets/text_field_button.dart';
import 'package:flutter_taxi/widgets/text_form_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var size = mediaQueryData.size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar('Регистрация'),
      body: Container(
        height: double.maxFinite,
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.15,
            ),
            Form(
              child: Padding(
                padding: const EdgeInsets.only(left: 18, right: 18),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    CustomTextFormField(title: 'Имя'),
                    SizedBox(
                      height: 16,
                    ),
                    CustomTextFormField(title: 'Электронная почта'),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormFieldButton(title: 'Пароль'),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            RoundedButton(
              title: 'Зарегистрироваться',
              page: VerifyScreen(),
            ),
            const Spacer(),
            const BottomTextButton(
              title: 'Уже есть учетная запись?',
              buttonTitle: 'Войти',
              page: LoginScreen(),
            )
          ],
        ),
      ),
    );
  }
}
