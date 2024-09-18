import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PageNoTwo(),
    );
  }
}

class PageNoTwo extends StatefulWidget {
  const PageNoTwo({Key? key}) : super(key: key);

  @override
  State<PageNoTwo> createState() => _PageNoTwoState();
}

class _PageNoTwoState extends State<PageNoTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('This is Second Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.flutter_dash, size: 70),
            SizedBox(height: 30),
            Container(
              padding: EdgeInsets.all(32),
              child: ElevatedButton(
                child: Text('Back'),
                onPressed: () => Navigator.of(context).pop()
              ),
            )
          ],
        ),
      ),
    );
  }
}