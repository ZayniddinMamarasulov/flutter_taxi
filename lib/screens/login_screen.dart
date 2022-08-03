import 'package:flutter/material.dart';
import 'package:flutter_taxi/resource/colors.dart';
import 'package:flutter_taxi/resource/components/round_button.dart';
import 'package:flutter_taxi/resource/components/text_field_form_widget.dart';
import 'package:flutter_taxi/resource/fonts_style.dart';
import 'package:flutter_taxi/utils/routes/routes_name.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 40),
          const Center(
            child: Text(
              'Sign In',
              style: AppFonts.headline1,
            ),
          ),
          SizedBox(height: size.height * 0.17),
          TextFieldFormWidget(
            title: 'Email',
            controller: _emailController,
            onFieldSubmitted: (String val) {
            },            keyboardType: TextInputType.emailAddress,
            obscureText: false,
            suffixIcon: false,
          ),
          TextFieldFormWidget(
            title: 'Password',
            controller: _passwordController,
            onFieldSubmitted: (String val) {},            keyboardType: TextInputType.text,
            obscureText: true,
            suffixIcon: true,
          ),
          SizedBox(height: size.height * 0.04),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36.0),
            child: RoundButton(
              onPressed: () {
                Navigator.pushNamed(context, RoutesName.home);
              },
              text: 'Sign In',
            ),
          ),
          const SizedBox(height: 60),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 59,
                height: 1,
                color: AppColors.greyStyleColor,
              ),
              const Text('Or Sign In With'),
              Container(
                width: 59,
                height: 1,
                color: AppColors.greyStyleColor,
              )
            ],
          ),
          SizedBox(height: size.height * 0.03),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'assets/facebook.png',
                  height: 50,
                  width: 50,
                ),
                Image.asset(
                  'assets/twitter.png',
                  height: 50,
                  width: 50,
                ),
                Image.asset(
                  'assets/gmail.png',
                  height: 50,
                  width: 50,
                ),
              ],
            ),
          ),
          SizedBox(height: size.height * 0.16),
          Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Don\'t have an account?',
                  style: TextStyle(color: AppColors.grey2StyleColor),
                ),
                SizedBox(width: 5),
                Text(
                  'Register',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: AppColors.deepGreenStyleColor,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
