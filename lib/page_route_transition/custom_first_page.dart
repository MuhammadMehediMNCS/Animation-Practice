import 'package:flutter/material.dart';

import 'custom_button.dart';
import 'custom_page_route.dart';
import 'page_two.dart';


class First_Page extends StatelessWidget {
  const First_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   primarySwatch: Colors.blue
      // ),
      // initialRoute: '/first',
      // onGenerateRoute: (route) => onGenerateRoute(route),
      home: Custom()
    );
  }
  
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/second':
        return CustomPageRoute(
          child: const SecondPage(),
          settings: settings
        );
      case '/first':
      default:
        return MaterialPageRoute(
          builder: (context) => const First_Page(),
          settings: settings
        );
    }
  }
}


class Custom extends StatefulWidget {
  const Custom({Key? key}) : super(key: key);

  @override
  State<Custom> createState() => _CustomState();
}

class _CustomState extends State<Custom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Route Transition'),
          centerTitle: true,
        ),
        body: Center(
          child: ButtonWidget(
            text: 'Custom Navigation',
            onClicked: () {
              Navigator.of(context).push(
                CustomPageRoute(
                  child: const SecondPage(),
                  direction: AxisDirection.up
                )
              );

              // Navigator.push(context, BouncyPageRoute(widget: widget));

              // Navigator.of(context).pushNamed('/second');
            }
          ),
        )
    );
  }
}