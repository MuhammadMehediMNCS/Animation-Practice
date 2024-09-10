import 'package:flutter/material.dart';

class STransition extends StatelessWidget {
  static const String title = 'Scale Transition';

  const STransition({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      home: ScTransition(title: title),
    );
  }
}

class ScTransition extends StatefulWidget {
  final String title;

  const ScTransition({super.key, required this.title});

  @override
  State<ScTransition> createState() => _ScTransitionState();
}

class _ScTransitionState extends State<ScTransition> with TickerProviderStateMixin {
  late final AnimationController controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> animation = CurvedAnimation(
    parent: controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: ScaleTransition(
          scale: animation,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: FlutterLogo(size: 150.0),
          ),
        ),
      ),
    );
  }
}
