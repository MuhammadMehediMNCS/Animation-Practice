import 'package:flutter/material.dart';

class DBTransition extends StatelessWidget {
  static const String title = 'DecoratedBox Transition';

  const DBTransition({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      home: TransitionDBox(),
    );
  }
}

class TransitionDBox extends StatefulWidget {
  const TransitionDBox({super.key});

  @override
  State<TransitionDBox> createState() => _TransitionDBoxState();
}

class _TransitionDBoxState extends State<TransitionDBox> with TickerProviderStateMixin {
  final DecorationTween decorationTween = DecorationTween(
    begin: BoxDecoration(
      color: const Color(0xFFFFFFFF),
      border: Border.all(style: BorderStyle.none),
      borderRadius: BorderRadius.circular(60.0),
      boxShadow: const <BoxShadow>[
        BoxShadow(
          color: Color(0x66666666),
          blurRadius: 10.0,
          spreadRadius: 3.0,
          offset: Offset(0, 6.0),
        ),
      ],
    ),
    end: BoxDecoration(
      color: const Color(0xFFFFFFFF),
      border: Border.all(
        style: BorderStyle.none,
      ),
      borderRadius: BorderRadius.zero,
    ),
  );

  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 3),
  )..repeat(reverse: true);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: DecoratedBoxTransition(
          decoration: decorationTween.animate(_controller),
          child: Container(
            width: 200,
            height: 200,
            padding: const EdgeInsets.all(10),
            child: const FlutterLogo(),
          ),
        ),
      ),
    );
  }
}
