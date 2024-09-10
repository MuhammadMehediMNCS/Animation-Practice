import 'package:flutter/material.dart';
//import 'dart:async';

class ModalBarriarAnimate extends StatelessWidget {
  static const String title = 'Animated Modal Barrier';

  const ModalBarriarAnimate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
    debugShowCheckedModeBanner: false,
    title: title,
    theme: ThemeData(
      primaryColor: Colors.blue.shade200,
      primarySwatch: Colors.orange
    ),
    home: const MBAnimation(title: title),
   ); 
  }
}

class MBAnimation extends StatefulWidget {
  final String title;

  const MBAnimation({Key? key, required this.title}) : super(key: key);

  @override
  State<MBAnimation> createState() => _MBAnimationState();
}

class _MBAnimationState extends State<MBAnimation> with SingleTickerProviderStateMixin {
  late Widget animatedModalBarrier;
  late AnimationController animationController;
  late Animation<Color?> colorAnimation;

  bool isPrassed = false;

  @override
  void initState() {
    super.initState();

    ColorTween colorTween = ColorTween(
      begin: Colors.orangeAccent.withOpacity(0.5),
      end: Colors.blueGrey.withOpacity(0.5)
    );

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3)
    );

    colorAnimation = colorTween.animate(animationController);

    animatedModalBarrier = AnimatedModalBarrier(
      color: colorAnimation,
      dismissible: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
                width: 150,
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.orangeAccent
                      ),
                      onPressed: () {
                        setState(() => isPrassed = true);
                        animationController.reset();
                        animationController.forward();
                        Future.delayed(const Duration(seconds: 3), () {
                          setState(() => isPrassed = false);
                        });
                      },
                      child: const Text('Press')
                    ),
                    if(isPrassed)
                    animatedModalBarrier
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}