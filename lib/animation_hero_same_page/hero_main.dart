import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  static final String title = 'Sidekick Example';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.deepOrange),
        //home: HomePage(),
      );
}