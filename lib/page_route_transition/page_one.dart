import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PageNoOne(),
    );
  }
}

class PageNoOne extends StatefulWidget {
  const PageNoOne({Key? key}) : super(key: key);

  @override
  State<PageNoOne> createState() => _PageNoOneState();
}

class _PageNoOneState extends State<PageNoOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('This is First Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}