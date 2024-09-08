import 'package:animation_work/sun_animation/widget_sun.dart';
import 'package:flutter/material.dart';

class SunAnimationMain extends StatelessWidget {
  final String appTitle = 'SunAnimation';

  const SunAnimationMain({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      theme: ThemeData(
        primaryColor: Colors.red
      ),
      home: SunPage(appTitle: appTitle),
    );
  }
}

class SunPage extends StatefulWidget {
  final String appTitle;

  const SunPage({Key? key, required this.appTitle}) : super(key: key);

  @override
  State<SunPage> createState() => _SunPageState();
}

class _SunPageState extends State<SunPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.appTitle),
      ),
      body: const Center(
        child: SunWidget(),
      ),
    );
  }
}