import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_taxi/utils/colors.dart';
import 'package:flutter_taxi/utils/strings.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';

// ignore: must_be_immutable
class VerificationScreen extends StatefulWidget {
  String phoneNumber;
  VerificationScreen(this.phoneNumber, {Key? key}) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  bool _onEditing = true;
  late String codes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Verify code',
          style: TextStyle(
            color: Color(0xff3E4958),
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(4),
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 8,
                ),
              ],
            ),
            child: const Icon(
              Icons.arrow_back_ios_rounded,
              color: Color(0xff3E4958),
              size: 20,
            ),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(height: 126, width: double.infinity),
          SizedBox(
            height: 45,
            width: 200,
            child: Text(
              stringSentTo.tr() +
                  {widget.phoneNumber}.toString() +
                  stringBySMS.tr(),
              style: const TextStyle(
                color: Color(0xff97ADB6),
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          VerificationCode(
            textStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
                color: const Color(0xff7EAB3A),
                fontSize: 36,
                fontWeight: FontWeight.w800),
            keyboardType: TextInputType.number,
            underlineColor: const Color(0xff7EAB3A),
            // If this is null it will use primaryColor: Colors.red from Theme
            length: 4,
            cursorColor: const Color(0xff7EAB3A),
            underlineUnfocusedColor: const Color(0xff7EAB3A),

            clearAll:  Padding(
              padding:const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
              child: Text(
                stringResent.tr(),
                style: const TextStyle(
                    fontSize: 12.0,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff97ADB6)),
              ),
            ),
            onCompleted: (String value) {
              setState(() {
                codes = value;
              });
            },
            onEditing: (bool value) {
              setState(() {
                _onEditing = value;
              });
              if (!_onEditing) FocusScope.of(context).unfocus();
            },
          ),
        ],
      ),
    );
  }
}
