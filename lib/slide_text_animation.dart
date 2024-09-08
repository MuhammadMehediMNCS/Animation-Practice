import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class SlideTextAnimation extends StatelessWidget {
  const SlideTextAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.indigo.shade200
      ),
      home: const SlideText(),
    );
  }
}

class SlideText extends StatefulWidget {
  const SlideText({Key? key}) : super(key: key);

  @override
  State<SlideText> createState() => _SlideTextState();
}

class _SlideTextState extends State<SlideText> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center, //EdgeInsets.only(top: 50),
        child: buildAnimatedText('This is Animated Text'),
      ),
    );
  }

  Widget buildAnimatedText(String text) => Marquee(
    text: text,
    style: const TextStyle(fontSize: 30, color: Colors.white),
    blankSpace: 95,
    velocity: 150, // -150
    pauseAfterRound: const Duration(seconds: 2),
  );
}