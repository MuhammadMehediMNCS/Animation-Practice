import 'package:flutter/material.dart';

class SldTransition extends StatelessWidget {
  static const String title = 'Slide Transition';

  const SldTransition({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      home: Scaffold(
        appBar: AppBar(title: const Text(title)),
        body: const Center(
          child: SlTransition(),
        ),
      ),
    );
  }
}

class SlTransition extends StatefulWidget {
  const SlTransition({super.key});

  @override
  State<SlTransition> createState() => _SlTransitionState();
}

class _SlTransitionState extends State<SlTransition> with SingleTickerProviderStateMixin {
  late final AnimationController controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<Offset> animation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(1.5, 0.0),
  ).animate(CurvedAnimation(
    parent: controller,
    curve: Curves.elasticIn,
  ));

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: animation,
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: FlutterLogo(size: 150.0),
      ),
    );
  }
}
