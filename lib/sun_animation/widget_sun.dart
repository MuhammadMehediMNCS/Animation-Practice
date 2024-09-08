import 'dart:math';

import 'package:flutter/material.dart';

class SunWidget extends StatefulWidget {
  const SunWidget({Key? key}) : super(key: key);

  @override
  State<SunWidget> createState() => _SunWidgetState();
}

class _SunWidgetState extends State<SunWidget> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<double> rotateAnimation;

  static const Color sunColor = Color(0xFFb1695a);

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);

    rotateAnimation = Tween<double>(begin: 0.0, end:  2 * pi).animate(_controller);

    _controller.repeat(period: Duration(seconds: 4));
  }

  @override
  void dispose() {
    super.dispose();

    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
    animation: _controller,
    builder: (context, child) => Transform.rotate(
      angle: rotateAnimation.value,
      child: child,
    ),
    child: Image.asset(
      'Assets/sun.png',
      color: sunColor,
      scale: 2,
    ),
  );
}