// ignore_for_file: unnecessary_null_comparison

import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedBuilderWidget extends StatelessWidget {
  static String title = 'Animated Builder';

  const AnimatedBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.black
      ),
      home: AnimatedB(title: title,)
    );
  }
}

class AnimatedB extends StatefulWidget {
  final String title;

  const AnimatedB({Key? key, required this.title}) : super(key: key);

  @override
  State<AnimatedB> createState() => _AnimatedBState();
}

class _AnimatedBState extends State<AnimatedB> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Container(color: Colors.green.shade300,width: 190, child: const Center(child: Text('Add Many Items')),),
      body: buildPages(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        selectedItemColor: Colors.red,
        items: const [
          BottomNavigationBarItem(
            icon: Text('AnimatedBuilder'),
            label: 'Rotation'
          ),
          BottomNavigationBarItem(
            icon: Text('AnimatedBuilder'),
            label: 'Transition'
          ),
          BottomNavigationBarItem(
            icon: Text('AnimatedBuilder'),
            label: 'Transform'
          )
        ],
        onTap: (int index) => setState(() => this.index = index),
      ),
    );
  }

  Widget buildPages() {
    switch(index) {
      case 0:
        return const RoationBoxWidget();
      case 1:
        return const SlideTransitionBoxWidget();
      case 2:
        return const TransformBoxWidget();
      default:
        return Container();
    }
  }
}


class RoationBoxWidget extends StatefulWidget {
  const RoationBoxWidget({Key? key}) : super(key: key);

  @override
  State<RoationBoxWidget> createState() => _RoationBoxWidgetState();
}

class _RoationBoxWidgetState extends State<RoationBoxWidget> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this
    )..repeat();

    animation = Tween<double>(
      begin: 0,
      end: 2 * pi
    ).animate(controller);
  }

  @override
  void dispose() {
    super.dispose();

    controller.dispose();
  }

  @override
  Widget build(BuildContext context) => Center(
    child: AnimatedBuilder(
      animation: animation,
      child: Container(
        color: Colors.red,
        width: 250,
        height: 250,
      ),
      builder: (context, child) => Transform.rotate(
        angle: animation.value,
        child: child,
      )
    ),
  );
}


class SlideTransitionBoxWidget extends StatefulWidget {
  const SlideTransitionBoxWidget({Key? key}) : super(key: key);

  @override
  State<SlideTransitionBoxWidget> createState() => _SlideTransitionBoxWidgetState();
}

class _SlideTransitionBoxWidgetState extends State<SlideTransitionBoxWidget> with SingleTickerProviderStateMixin{
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(seconds: 8),
      vsync: this
    );

    animation = Tween<double>(begin: -1, end: 0).animate(controller);

    startAnimation();
  }

  void startAnimation() {
    final isFirst = animation == null || animation.value == 1;
    final curvedAnimation = CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);

    if(isFirst) {
      animation = Tween<double>(begin: -1, end: 0).animate(
        curvedAnimation)..addStatusListener(listenAnimation);
    } else {
      animation = Tween<double>(begin: 0, end: 1).animate(
        curvedAnimation)..addStatusListener(listenAnimation);
    }

    controller.reset();
    controller.forward();
  }

  void listenAnimation(AnimationStatus status) {
    if(status == AnimationStatus.completed) {
      animation.removeStatusListener(listenAnimation);
      startAnimation();
    }
  }

  @override
  void dispose() {
    super.dispose();

    controller.dispose();
  }

  @override
  Widget build(BuildContext context) => Center(
    child: AnimatedBuilder(
      animation: animation,
      child: Container(
        color: Colors.blue,
        height: 250,
        width: 250,
      ),
      builder: (context, child) {
        final width = MediaQuery.of(context).size.width;
        final x = animation.value * width;

        return Transform(
          transform: Matrix4.translationValues(x, 0, 0),
          child: child,
        );
      }
    ),
  );
}


class TransformBoxWidget extends StatefulWidget {
  const TransformBoxWidget({Key? key}) : super(key: key);

  @override
  State<TransformBoxWidget> createState() => _TransformBoxWidgetState();
}

class _TransformBoxWidgetState extends State<TransformBoxWidget> with SingleTickerProviderStateMixin{
  late AnimationController controller;
  late Animation<double> sizeAnimation;
  late Animation<BorderRadius?> radiusAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this
    )..repeat();

    final curveAnimation = CurvedAnimation(parent: controller, curve: Curves.ease);

    sizeAnimation = Tween<double>(begin: 50, end: 250).animate(curveAnimation);
    radiusAnimation = BorderRadiusTween(
      begin: BorderRadius.circular(60),
      end: BorderRadius.circular(16)
    ).animate(curveAnimation);
  }

  @override
  void dispose() {
    super.dispose();

    controller.dispose();
  }

  @override
  Widget build(BuildContext context) => Center(
    child: AnimatedBuilder(
      animation: controller,
      builder: (context, child) => Container(
        width: sizeAnimation.value,
        height: sizeAnimation.value,
        decoration: BoxDecoration(
          color: Colors.greenAccent,
          borderRadius: radiusAnimation.value
        ),
      )
    ),
  );
}