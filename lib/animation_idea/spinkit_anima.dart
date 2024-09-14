import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class SpinKitDemo extends StatelessWidget {
  final _loading = ValueNotifier(false);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SpinKit Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        body: Center(
          child: ValueListenableBuilder(
            valueListenable: _loading,
            builder: (BuildContext context, bool value, child) {
              if (value) {
                return SpinKitFadingCircle(
                  color: Colors.red,
                  size: 50.0,
                );
              } else {
                return ElevatedButton(
                  onPressed: () async {
                    try {
                      _loading.value = true;
                      await Future.delayed(const Duration(seconds: 5));
                    } finally {
                      _loading.value = false;
                    }
                  },
                  child: Text('Login'));
              }
            },
          ),
        ),
      ),
    );
  }
}