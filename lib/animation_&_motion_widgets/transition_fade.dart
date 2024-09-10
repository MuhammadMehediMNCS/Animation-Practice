import 'package:flutter/material.dart';

class FadeTrans extends StatelessWidget {
  static const String title = 'Fade Animation';

  const FadeTrans({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        primaryColor: Colors.amber.shade200,
        primarySwatch: Colors.indigo
      ),
      home: const FTransition(title: title),
    );
  }
}

class FTransition extends StatefulWidget {
  final String title;

  const FTransition({super.key, required this.title});

  @override
  State<FTransition> createState() => _FTransitionState();
}

class _FTransitionState extends State<FTransition> with TickerProviderStateMixin{
  late final AnimationController controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this
  )..repeat(reverse: true);
  late final Animation<double> animation = CurvedAnimation(
    parent: controller,
    curve: Curves.easeIn
  );

  @override
  void dispose() {
    super.dispose();

    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: FadeTransition(
          opacity: animation,
          child: const FlutterLogo(size: 80),
        ),
      ),
    );
  }
}