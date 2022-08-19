import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_taxi/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({Key? key}) : super(key: key);

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  String code = '';

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    Size size = mediaQueryData.size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(4),
            height: 48,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: const Offset(0, 2)),
              ],
            ),
            child: const Icon(
              Icons.keyboard_arrow_left_outlined,
              color: Colors.black,
              size: 25,
            ),
          ),
        ),
        title: const Text(
          'Verify code',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Color(0xff3E4958)),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Код был отправлен на \n+7 953 508 40 05 на SMS',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color(0xff97ADB6),
                fontWeight: FontWeight.w400,
                fontSize: 15),
          ),
          Container(
            width: double.maxFinite,
            height: 40,
            margin: EdgeInsets.only(top: size.height * 0.1, bottom: 10),
            child: ListView.builder(
              controller: ScrollController(),
              dragStartBehavior: DragStartBehavior.down,
              clipBehavior: Clip.hardEdge,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.25),
              itemCount: code.split('').length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: size.width * 0.1,
                  height: 36,
                  margin: const EdgeInsets.only(left: 5, right: 5),
                  child: Text(
                    code.split('')[index],
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 36, color: Colors.green),
                  ),
                );
              },
            ),
          ),
          Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.25),
              margin: const EdgeInsets.only(bottom: 25),
              height: 5,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: code.split('').length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 5,
                    width: size.width * 0.1,
                    color: Colors.green,
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                  );
                },
              )),
          code.length == 4
              ? TextButton(
                  onPressed: () {
                    setState(() {
                      code = '';
                    });
                  },
                  child: const Text(
                    'Повторить отправку',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff97ADB6),
                    ),
                  ),
                )
              : const Text(
                  'Введите код ( 0:30 )',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff97ADB6),
                  ),
                ),
          const Spacer(),
          buildKeyboard(size),
        ],
      ),
    );
  }

  final List<String> numbers = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    'check',
    '0',
    'backspace'
  ];
  int indexList = 0;

  void saveLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLogin', true);
  }

  Widget buildKeyboard(Size size) {
    return SizedBox(
      height: size.height * 0.35,
      width: double.maxFinite,
      child: GridView.builder(
        itemCount: numbers.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, childAspectRatio: 1.8),
        itemBuilder: (BuildContext context, int index) {
          if (numbers[index] == 'check') {
            return GestureDetector(
              onTap: () {
                saveLogin();
                if (code.length == 4) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const HomeScreen()));
                }
              },
              child: Container(
                width: size.width / 3,
                height: size.height * 0.09,
                color: Colors.white,
                child: const Icon(
                  Icons.check_circle,
                  color: Color(0xff7EAB3A),
                ),
              ),
            );
          }
          if (numbers[index] == 'backspace') {
            return GestureDetector(
              onTap: () {
                if (code.isNotEmpty) {
                  setState(() {
                    code = code.replaceRange(code.length - 1, code.length, '');
                  });
                }
              },
              child: Container(
                width: size.width / 3,
                height: size.height * 0.09,
                color: Colors.white,
                child: const Icon(
                  Icons.backspace,
                  color: Color(0xff97ADB6),
                ),
              ),
            );
          }
          return GestureDetector(
            onTap: () {
              if (code.length < 4) {
                setState(() {
                  code = code + numbers[index];
                });
              }
            },
            child: Container(
              width: size.width / 3,
              height: size.height * 0.09,
              color: Colors.white,
              child: Center(
                child: Text(
                  numbers[index],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
