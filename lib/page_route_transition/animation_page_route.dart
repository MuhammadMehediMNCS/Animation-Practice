import 'package:animation_work/page_route_transition/page_two.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class TransitionAnimate extends StatelessWidget {
  const TransitionAnimate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FadeTransition(),
    );
  }
}

class RLtoTB extends StatefulWidget {
  const RLtoTB({Key? key}) : super(key: key);

  @override
  State<RLtoTB> createState() => _RLtoTBState();
}

class _RLtoTBState extends State<RLtoTB> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(32),
        child: ElevatedButton(
          child: const Text('Right Left Top Bottom'),
          onPressed: () => Navigator.of(context).push(
            PageTransition(
              type: PageTransitionType.leftToRight,
              child: const SecondPage()
            )
          )
        ),
      ),
    );
  }
}



class JoinedTransition extends StatefulWidget {
  const JoinedTransition({Key? key}) : super(key: key);

  @override
  State<JoinedTransition> createState() => _JoinedTransitionState();
}

class _JoinedTransitionState extends State<JoinedTransition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(32),
        child: ElevatedButton(
          child: const Text('Right Left Top Bottom'),
          onPressed: () => Navigator.of(context).push(
            PageTransition(
              type: PageTransitionType.leftToRightJoined,
              childCurrent: widget,
              duration: const Duration(milliseconds: 2000),
              reverseDuration: const Duration(milliseconds: 2000),
              child: const SecondPage()
            )
          )
        ),
      ),
    );
  }
}



class FadeTransition extends StatefulWidget {
  const FadeTransition({Key? key}) : super(key: key);

  @override
  State<FadeTransition> createState() => _FadeTransitionState();
}

class _FadeTransitionState extends State<FadeTransition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(32),
        child: ElevatedButton(
          child: Text('Right Left Top Bottom'),
          onPressed: () => Navigator.of(context).push(
            PageTransition(
              type: PageTransitionType.fade, // fade, rightToLeftWithFade
              child: SecondPage()
            )
          )
        ),
      ),
    );
  }
}




class ScaleTransition extends StatefulWidget {
  const ScaleTransition({Key? key}) : super(key: key);

  @override
  State<ScaleTransition> createState() => _ScaleTransitionState();
}

class _ScaleTransitionState extends State<ScaleTransition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(32),
        child: ElevatedButton(
          child: Text('Right Left Top Bottom'),
          onPressed: () => Navigator.of(context).push(
            PageTransition(
              type: PageTransitionType.scale,     // rotate, size
              alignment: Alignment.bottomCenter,
              child: SecondPage()
            )
          )
        ),
      ),
    );
  }
}