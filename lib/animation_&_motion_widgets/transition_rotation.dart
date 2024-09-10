import 'package:flutter/material.dart';

class RTransition extends StatelessWidget {
  static const String title = 'Rotation Transition';

  const RTransition({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      home: RoTransition(title: title),
    );
  }
}

class RoTransition extends StatefulWidget {
  final String title;
  const RoTransition({super.key, required this.title});

  @override
  State<RoTransition> createState() => _RoTransitionState();
}

class _RoTransitionState extends State<RoTransition> with TickerProviderStateMixin {
  late final AnimationController controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> animation = CurvedAnimation(
    parent: controller,
    curve: Curves.easeIn,
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
        child: RotationTransition(
          turns: animation,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: FlutterLogo(size: 150.0),
          ),
        ),
      ),
    );
  }
}
