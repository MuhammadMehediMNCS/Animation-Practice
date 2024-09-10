import 'dart:math';

import 'package:flutter/material.dart';

class ContainerAnimate extends StatelessWidget {
  final String title = 'Animated Container';

  const ContainerAnimate({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange
      ),
      home: AnimatedCon(title: title)
    );
  }
}

class AnimatedCon extends StatefulWidget {
  final String title;

  const AnimatedCon({Key? key, required this.title}) : super(key: key);

  @override
  State<AnimatedCon> createState() => _AnimatedConState();
}

class _AnimatedConState extends State<AnimatedCon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FollowButtonWidget(),
            SizedBox(height: 40),
            RandomButtonWidget()
          ],
        ),
      ),
    );
  }
}


class FollowButtonWidget extends StatefulWidget {
  const FollowButtonWidget({Key? key}) : super(key: key);

  @override
  State<FollowButtonWidget> createState() => _FollowButtonWidgetState();
}

class _FollowButtonWidgetState extends State<FollowButtonWidget> {
  bool isSmall = true;

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: () {
      setState(() {
        isSmall = !isSmall;
      });
    },
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
      width: isSmall ? 50 : 200,
      height: 50,
      child: isSmall ? buildShrinked() : buildStretched(),
    ),
  );

  Widget buildStretched() => Container(
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(color: Colors.red, width: 2.5),
      borderRadius: BorderRadius.circular(24),
    ),
    child: const Center(
      child: FittedBox(
        child: Text(
          'FOLLOW',
          style: TextStyle(
            color: Colors.red,
            letterSpacing: 1.5,
            fontWeight: FontWeight.w600
          ),
        ),
      ),
    ),
  );

  Widget buildShrinked() => Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25),
      color: Colors.red
    ),
    child: const Icon(
      Icons.people,
      color: Colors.white,
    ),
  );
}

class RandomButtonWidget extends StatefulWidget {
  const RandomButtonWidget({Key? key}) : super(key: key);

  @override
  State<RandomButtonWidget> createState() => _RandomButtonWidgetState();
}

class _RandomButtonWidgetState extends State<RandomButtonWidget> {
  static const double minSize = 50;
  static const double maxSize = 200;

  Color color = Colors.green;
  double width = maxSize;
  double height = minSize;
  BorderRadius borderRadius = BorderRadius.zero;

  @override
  Widget build(BuildContext context) => Column(
    children: [
      Container(
        color: Colors.black.withOpacity(0.1),
        width: maxSize,
        height: maxSize,
        child: Center(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInBack,
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: color,
              borderRadius: borderRadius
            ),
          ),
        ),
      ),
      const SizedBox(height: 20),
      TextButton(
        child: const Text(
          'Do Magic!',
          style: TextStyle(color: Colors.black),
        ),
        onPressed: () {
          final random = Random();
          // Color
          final red = random.nextInt(255);
          final green = random.nextInt(255);
          final blue = random.nextInt(255);
          final color = Color.fromRGBO(red, green, blue, 1);
          // Size
          final size = generateSize();
          // BorderRadius
          final borderRadius = BorderRadius.circular(random.nextDouble() * 80);

          setState(() {
            this.color = color;
            this.width = size.width;
            this.height = size.height;
            this.borderRadius = borderRadius;
          });
        }
      )
    ],
  );

  Size generateSize() {
    final random = Random();
    final addMax = maxSize.toInt() - minSize.toInt();
    final width = minSize + random.nextInt(addMax);
    final height = minSize + random.nextInt(addMax);

    return Size(width, height);
  }
}