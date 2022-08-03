
import 'package:flutter/material.dart';

AppBar appBar (String title){
  return AppBar(
    centerTitle: true,
    backgroundColor: Colors.white,
    elevation: 0,
    title: Text(title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Color(0xff3E4958),
        )),
  );
}
