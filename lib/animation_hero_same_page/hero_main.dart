import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  static const String title = 'Sidekick Example';

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.deepOrange),
        //home: HomePage(),
      );
}