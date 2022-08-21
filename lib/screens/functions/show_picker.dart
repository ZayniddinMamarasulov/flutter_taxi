import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

int index = 0;
final list = ["O'zbek tili", "English language", "Русская язык"];
final List locales = const[
  Locale("uz", "UZ"),
  Locale("en", "US"),
  Locale("ru", "RU")
];
void _showPicker(BuildContext context) {
  showCupertinoModalPopup(
      barrierColor: Colors.transparent,
      context: context,
      builder: (_) =>
          SizedBox(
            height: 100,
            child: CupertinoPicker(
                scrollController: FixedExtentScrollController(
                    initialItem: index),
                backgroundColor: Theme
                    .of(context)
                    .backgroundColor,
                onSelectedItemChanged: (value) {
                  setState(() {
                    index = value;
                  });
                },
                itemExtent: 50,
                children: List<Widget>.generate(list.length, (index) =>
                    Center(child: Text(list[index])))),
          )).then((value) { context.setLocale(locales[index]);
  });
}

void setState(Null Function() param0) {
}