import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';

class VerificatonPage extends StatefulWidget {
  const VerificatonPage({Key? key}) : super(key: key);

  @override
  State<VerificatonPage> createState() => _VerificatonPageState();
}

class _VerificatonPageState extends State<VerificatonPage> {
  bool _onEditing = true;
  late String _code;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.7),
                              blurRadius: 5,
                              spreadRadius: 2,
                              offset: Offset(0, 2),
                            )
                          ]),
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_back_ios_rounded,
                            color: Colors.black,
                          )),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 100,
              ),
              Text(
                "Kod yuborildi",
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "+99899 707 88 35 ga SMS",
                style: TextStyle(color: Colors.black45, fontSize: 16),
              ),
              SizedBox(
                height: 40,
              ),
              VerificationCode(
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Color(0xff7cb342),
                ),
                underlineColor: Colors.green,
                length: 4,
                fillColor: Colors.green,
                onCompleted: (String value) {
                  setState(() {
                    _code = value;
                  });
                },
                onEditing: (bool value) {
                  setState(() {
                    _onEditing = value;
                  });
                  if (!_onEditing) FocusScope.of(context).unfocus();
                },
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: _onEditing
                      ? Text(
                          "To'liq kodni kiriting",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black45),
                        )
                      : Text('Sizning kodingiz: $_code'),
                ),
              ),
              Text(
                "Qayta yuborish",
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
      ),
    );
  }
}
