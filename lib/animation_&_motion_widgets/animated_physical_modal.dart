import 'package:flutter/material.dart';

class AniPhysicalModal extends StatelessWidget {
  const AniPhysicalModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple
      ),
      home: const PhysicalModelAnimated()
    );
  }
}


class PhysicalModelAnimated extends StatefulWidget {
  const PhysicalModelAnimated({Key? key}) : super(key: key);

  @override
  State<PhysicalModelAnimated> createState() => _PhysicalModelAnimatedState();
}

class _PhysicalModelAnimatedState extends State<PhysicalModelAnimated> {
  bool isFlat = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Physical Model'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedPhysicalModel(     // We can use only 'PhyscalModel'.
              duration: const Duration(milliseconds: 1500),
              shape: BoxShape.rectangle,
              color: isFlat ? Colors.green : Colors.white,
              shadowColor: Colors.purple,
              elevation: isFlat ? 0 : 16,
              borderRadius: isFlat ? BorderRadius.circular(0) : BorderRadius.circular(30),
              child: const SizedBox(
                height: 220,
                width: 220,
                child: FlutterLogo(
                  size: 100,
                ),
              ),
            ),
            const SizedBox(height: 30),
            TextButton(
              child: const Text('Changed'),
              onPressed: () => setState(() {isFlat = !isFlat;})
            )
          ],
        ),
      )
    );
  }
}