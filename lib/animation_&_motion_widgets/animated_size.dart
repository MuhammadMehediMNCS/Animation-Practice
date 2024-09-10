import 'package:flutter/material.dart';

class SizeAnimation extends StatelessWidget {
  static const String title = 'Animated Size';

  const SizeAnimation({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        primaryColor: Colors.red.shade300,
        primarySwatch: Colors.lightBlue
      ),
      home: const ASize(title: title),
    );
  }
}

class ASize extends StatefulWidget {
  final String title;

  const ASize({Key? key, required this.title}) : super(key: key);

  @override
  State<ASize> createState() => _ASizeState();
}

class _ASizeState extends State<ASize> {
  double shaped = 300;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: GestureDetector(
          onTap: () => setState(() => shaped = shaped == 300 ? 100 : 300),
          child: AnimatedSize(
            duration: const Duration(seconds: 1),
            curve: Curves.easeIn,
            child: FlutterLogo(size: shaped),
          ),
        ),
      ),
    );
  }
}