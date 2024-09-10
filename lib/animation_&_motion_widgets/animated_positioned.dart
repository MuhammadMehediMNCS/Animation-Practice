import 'package:flutter/material.dart';

class PositionAnimation extends StatelessWidget {
  static const String title = 'Animated Positioned';

  const PositionAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        primaryColor: Colors.green.shade300,
        primarySwatch: Colors.grey
      ),
      home: const APosi(),
    );
  }
}

class APosition extends StatefulWidget {
  final String title;

  const APosition({Key? key, required this.title}) : super(key: key);

  @override
  State<APosition> createState() => _APositionState();
}

class _APositionState extends State<APosition> {
  bool isTap = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: SizedBox(
        height: 350,
        width: 200,
        child: Stack(
          children: [
            AnimatedPositioned(
              // ignore: sort_child_properties_last
              child: GestureDetector(
                onTap: () => setState(() => isTap = !isTap),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.all(Radius.circular(25))
                  ),
                ),
              ),
              width: isTap ? 200 : 50,
              height:  isTap ? 50 : 200,
              top: isTap ? 50 : 150,
              curve: Curves.fastOutSlowIn,
              duration: const Duration(seconds: 2)
            )
          ],
        ),
      ),
    );
  }
}

class APosi extends StatefulWidget {
  const APosi({super.key});

  @override
  State<APosi> createState() => _APosiState();
}

class _APosiState extends State<APosi> with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this
  )..repeat(reverse: true);
  }

  @override
  void dispose() {
    super.dispose();

    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const double smallLogo = 100;
    const double largeLogo = 200;

    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final Size biggest = constraints.biggest;

          return Stack(
            children: [
              PositionedTransition(
                rect: RelativeRectTween(
                  begin: RelativeRect.fromSize(
                    Rect.fromLTWH(
                      biggest.width / 2 - smallLogo / 2,
                      0,
                      smallLogo,
                      smallLogo
                    ), biggest
                  ),
                  end: RelativeRect.fromSize(
                    Rect.fromLTWH(
                      biggest.width / 2 - largeLogo / 2,
                      biggest.height - largeLogo,
                      largeLogo,
                      largeLogo
                    ),
                    biggest
                  )
                ).animate(
                  CurvedAnimation(
                    parent: controller,
                    curve: Curves.slowMiddle
                  )
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red.shade200,
                      border: Border.all(color: Colors.black12)
                    ),
                  ),
                )
              )
            ],
          );
        }
      ),
    );
  }
}