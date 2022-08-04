import 'package:flutter/material.dart';
import 'package:flutter_taxi/resource/colors.dart';
import 'package:flutter_taxi/resource/components/round_button.dart';
import 'package:flutter_taxi/resource/components/text_field_form_widget.dart';
import 'package:flutter_taxi/resource/fonts_style.dart';
import 'package:flutter_taxi/screens/sign_in_screen.dart';
import 'package:flutter_taxi/utils/routes/routes_name.dart';

import '../utils/routes/routes.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.primaryWhiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40),
            const Center(
              child: Text(
                'Sign Up',
                style: AppFonts.headline1,
              ),
            ),
            SizedBox(height: size.height * 0.19),
            TextFieldFormWidget(
              title: 'Name',
              controller: _nameController,
              onFieldSubmitted: (String val) {},
              keyboardType: TextInputType.text,
              obscureText: false,
              suffixIcon: false,
            ),
            TextFieldFormWidget(
              title: 'Email',
              controller: _emailController,
              onFieldSubmitted: (String val) {},
              keyboardType: TextInputType.emailAddress,
              obscureText: false,
              suffixIcon: false,
            ),
            TextFieldFormWidget(
              title: 'Password',
              controller: _passwordController,
              onFieldSubmitted: (String val) {},
              keyboardType: TextInputType.text,
              obscureText: true,
              suffixIcon: true,
            ),
            SizedBox(height: size.height * 0.04),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36.0),
              child: RoundButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, RoutesName.login, (route) => false);
                },
                text: 'Register',
              ),
            ),
            SizedBox(height: size.height * 0.23),
            Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Already have an account?',
                    style: TextStyle(color: AppColors.grey2StyleColor),
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Sign In',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: AppColors.deepGreenStyleColor,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
