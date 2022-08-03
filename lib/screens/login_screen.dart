import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_taxi/components/appBar.dart';
import 'package:flutter_taxi/screens/home_screen.dart';
import 'package:flutter_taxi/screens/register_screen.dart';
import 'package:flutter_taxi/widgets/bottom_text_button.dart';
import 'package:flutter_taxi/widgets/rounded_button.dart';
import 'package:flutter_taxi/widgets/text_field_button.dart';
import 'package:flutter_taxi/widgets/text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var size = mediaQueryData.size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar('Вход'),
      body: Container(
        height: double.maxFinite,
        padding: EdgeInsets.only(left: 18, right: 18),
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.15,
            ),
            const CustomTextFormField(title: 'Электронная почта'),
            const SizedBox(
              height: 16,
            ),
            const TextFormFieldButton(title: 'Пароль'),
            const SizedBox(
              height: 50,
            ),
            RoundedButton(title: 'Войти',page: HomeScreen(),),
            Row(
              children: [
                Container(
                  height: 1,
                  width: size.width * 0.15,
                  color: const Color(0xffD5DDE0),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Text(
                    'Или Войдите С помощью'.toUpperCase(),
                    style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff3E4958)),
                  ),
                ),
                Container(
                  height: 1,
                  width: size.width * 59 / 375,
                  color: Color(0xffD5DDE0),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/icons/facebook.svg',
                    height: 50, width: 50, color: Color(0xffD5DDE0)),
                const SizedBox(width: 15,),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffD5DDE0)
                  ),
                  child: SvgPicture.asset('assets/icons/twitter.svg',
                      height: 30, width: 30, color: Colors.white),
                ),
                const SizedBox(width: 15,),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffD5DDE0)
                  ),
                  child: SvgPicture.asset('assets/icons/google.svg',
                      height: 30, width: 30, color: Colors.white),
                )
              ],
            ),
            const Spacer(),
            const BottomTextButton(
              title: 'Нет учетной записи? ',
              buttonTitle: 'Регистрация',
              page: RegisterScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
