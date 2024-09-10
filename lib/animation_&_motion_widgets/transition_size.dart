import 'package:flutter/material.dart';

class SizTransition extends StatelessWidget {
  static const String title = 'Size Transition';

  const SizTransition({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      home: TransitionSiz(title: title),
    );
  }
}

class TransitionSiz extends StatefulWidget {
  final String title;

  const TransitionSiz({super.key, required this.title});

  @override
  State<TransitionSiz> createState() => _TransitionSizState();
}

class _TransitionSizState extends State<TransitionSiz> with TickerProviderStateMixin {
  late final AnimationController controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..repeat();
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
      body: SizeTransition(
        sizeFactor: animation,
        axis: Axis.horizontal,
        axisAlignment: -1,
        child: const Center(
          child: FlutterLogo(size: 200.0),
        ),
      ),
    );
  }
}
