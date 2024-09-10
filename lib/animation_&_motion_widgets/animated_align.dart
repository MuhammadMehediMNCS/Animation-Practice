import 'package:flutter/material.dart';

class AlignmentAnimate extends StatelessWidget {
  const AlignmentAnimate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimationTwo(),
    );
  }
}

class AnimationOne extends StatefulWidget {
  const AnimationOne({Key? key}) : super(key: key);

  @override
  State<AnimationOne> createState() => _AnimationOneState();
}

class _AnimationOneState extends State<AnimationOne> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Align'),
      ),
      body: GestureDetector(
        onTap: () => setState(() {selected = !selected;}),
        child: Center(
          child: Container(
            width: 250.0,
            height: 250.0,
            color: Colors.red,
            child: AnimatedAlign(
              alignment: selected ? Alignment.topRight : Alignment.bottomLeft,
              duration: const Duration(seconds: 2),
              curve: Curves.fastOutSlowIn,
              child: const FlutterLogo(size: 60.0),
            ),
          ),
        ),
      ),
    );
  }
}




class AnimationTwo extends StatefulWidget {
  const AnimationTwo({Key? key}) : super(key: key);

  @override
  State<AnimationTwo> createState() => _AnimationTwoState();
}

class _AnimationTwoState extends State<AnimationTwo> {
  bool change = false;
  bool changeColor = false;
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:changeColor ? Colors.black : Colors.white,
      body: Stack(
        children: [
          InkWell(
            onTap: () => setState(() {change = !change;}),
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: AnimatedAlign(
                onEnd: () => setState(() {
                  changeColor = !changeColor;
                  isVisible = !isVisible;
                }),
                curve: Curves.decelerate,
                alignment: change ? Alignment.topCenter : Alignment.bottomCenter,
                duration: const Duration(seconds: 2),
                child: Container(
                  height: 15.0,
                  color: Colors.red,
                ),
              ),
            ),
          ),
          Visibility(
            visible: isVisible,
            child: const Center(
              child: Text(
                'How did this Animation?',
                style: TextStyle(color: Colors.blue, fontSize: 40, fontWeight: FontWeight.w500),
              ),
            ),
          )
        ]
      ),
    );
  }
}