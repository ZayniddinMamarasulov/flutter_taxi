import 'dart:async';

import 'package:flutter/material.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';

class SimpleAnimationWidget extends StatefulWidget {
  const SimpleAnimationWidget(
      {Key? key,
      required this.image,
      required this.backgroundColor,
      required this.duration,
      required this.delay})
      : super(key: key);

  final String image;
  final Color backgroundColor;
  final Duration duration;
  final Duration delay;

  @override
  State<SimpleAnimationWidget> createState() => _SimpleAnimationWidgetState();
}

class _SimpleAnimationWidgetState extends State<SimpleAnimationWidget> {
  @override
  void initState() {
    startTimer();
    super.initState();
  }

  Future<Timer> startTimer() async {
    var duration = widget.duration;
    return Timer(duration, route);
  }

  route() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return RippleAnimation(
      repeat: false,
      delay: widget.delay,
      color: widget.backgroundColor,
      duration: widget.duration,
      ripplesCount: 10,
      minRadius: 60,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
