import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class DefaultTextSyleAnimate extends StatelessWidget {
  static const String title = 'Animated Builder';

  const DefaultTextSyleAnimate({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: const Color.fromARGB(255, 156, 198, 233)
      ),
      home: const ADTextStyle(title: title,)
    );
  }
}

class ADTextStyle extends StatefulWidget {
  final String title;

  const ADTextStyle({Key? key, required this.title}) : super(key: key);

  @override
  State<ADTextStyle> createState() => _ADTextStyleState();
}

class _ADTextStyleState extends State<ADTextStyle> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: buildPages(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        selectedItemColor: Colors.red,
        items: const [
          BottomNavigationBarItem(
            icon: Text('AnimatedDefaultText'),
            label: '...................................'
          ),
          BottomNavigationBarItem(
            icon: Text('AnimatedTextStyle'),
            label: '....................................'
          ),
          BottomNavigationBarItem(
            icon: Text('AnimatedIcon'),
            label: '...............................'
          )
        ],
        onTap: (int index) => setState(() => this.index = index),
      ),
    );
  }

  Widget buildPages() {
    switch(index) {
      case 0:
        return const ZoomText();
      case 1:
        return const MultiZoomText();
      case 2:
        return const AnimationIcon();
      default:
        return Container();
    }
  }
}


class ZoomText extends StatefulWidget {
  const ZoomText({Key? key}) : super(key: key);

  @override
  State<ZoomText> createState() => _ZoomTextState();
}

class _ZoomTextState extends State<ZoomText> {
  double fontSize = 60;
  Color color = Colors.blue;
  bool first = true;

  @override
  Widget build(BuildContext context) => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedDefaultTextStyle(
          style: TextStyle(
            fontSize: fontSize,
            color: color,
            fontWeight: FontWeight.bold
          ),
          duration: const Duration(milliseconds: 500),
          child: const Text('Animated Text')
        ),
        const SizedBox(height: 120),
        buildButton()
      ],
    ),
  );

  Widget buildButton() => Container(
    decoration: BoxDecoration(
      border: Border.all(color: Colors.blue, width: 4),
      borderRadius: BorderRadius.circular(16),
      //shape: BoxShape.circle,
      //gradient: LinearGradient(colors: [Colors.lightBlue, Colors.yellow]),
      // boxShadow: [
      //   BoxShadow(
      //     color: Colors.black12,
      //     offset: Offset(5,5)
      //   )
      // ],
      // color: Colors.green,
    ),
    child: TextButton(
      onPressed: () {
        setState(() {
          fontSize = first ? 60 : 20;
          color = first ? Colors.red.shade200 : Colors.blue.shade300;
          first = !first;
        });
      },
      child: const Text(
        'Switch',
        style: TextStyle(fontSize: 50),
      )
    ),
  );
}


class MultiZoomText extends StatefulWidget {
  const MultiZoomText({Key? key}) : super(key: key);

  @override
  State<MultiZoomText> createState() => _MultiZoomTextState();
}

class _MultiZoomTextState extends State<MultiZoomText> {
  late TextStyle textStyle;
  late FontStyle fontStyle;
  late FontWeight fontWeight;
  late TextDecoration textDecoration;

  double fontSize = 30;
  Color color = Colors.black;
  bool boldText = false;
  bool loop =  false;
  bool loop2 = false;

  @override
  void initState() {
    super.initState();

    textStyle = TextStyle();
    fontStyle = FontStyle.normal;
    fontWeight = FontWeight.normal;
    textDecoration = TextDecoration.none;

    animateRandomColorAndSize() {
      loop = false;
      fontSize = Random().nextDouble() * 50;
      generateRandomColor();
    }
    generateRandomColor();
    randomColorAndSize();
    getBoldText();
    getItalicText();
    increaseFontSize();
    decreaseFontSize();
    animatedLoop();
    animatedLoop2();
    endCallback();
    endCallback2();
  }

  void animateState() {
    setState(() {
      textStyle = TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
        fontStyle: fontStyle
      );
    });
  }

  void generateRandomColor() {
    color = Color.fromARGB(255, Random().nextInt(255), Random().nextInt(255), Random().nextInt(255));
    animateState();
  }

  void randomColorAndSize() {}

  void getBoldText() {
    loop = false;
    fontStyle = FontStyle.normal;
    fontWeight = FontWeight.w900;
    animateState();
  }

  void getItalicText() {
    loop = false;
    fontStyle = FontStyle.italic;
    FontWeight.normal;
    animateState();
  }

  void increaseFontSize() {
    loop = false;
    fontSize += 4;
    animateState();
  }

  void decreaseFontSize() {
    loop = false;
    fontSize -= 4;
    animateState();
  }

  void animatedLoop() {
    loop = !loop;
    fontWeight = FontWeight.w900;
    generateRandomColor();
  }

  void animatedLoop2() {
    loop2 = !loop2;
    generateRandomColor();
  }

  void endCallback() {
    fontWeight = boldText ? FontWeight.w900 : FontWeight.w100;
    boldText = !boldText;
    generateRandomColor();
  }

  void endCallback2() {
    fontSize = Random().nextDouble() * 50;
    fontWeight = boldText ? FontWeight.w900 : FontWeight.w100;
    boldText = !boldText;
    generateRandomColor();
  }

  @override
  Widget build(BuildContext context) => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedDefaultTextStyle(
          style: textStyle,
          duration: const Duration(microseconds: 800),
          onEnd: loop ? endCallback : null,
          child: const Text('Multi Zoom Text'),
          //onEnd: loop2 ? endCallback2 : null,
          //curve: Curves.easeOut,
          //overflow: TextOverflow.clip,
          //softWrap: true,
          //textAlign: TextAlign.right,
        ),
        TextButton(onPressed: getItalicText, child: const Text('Italic Animate')),
        TextButton(onPressed: getBoldText, child: const Text('Bold Animate')),
        TextButton(onPressed: increaseFontSize, child: const Text('FontSize by +4'),),
        TextButton(onPressed: decreaseFontSize, child: const Text('FontSize By -4'),),
        TextButton(onPressed: generateRandomColor, child: const Text('Random Color'),),
        TextButton(onPressed: randomColorAndSize, child: const Text('Random Color And Size'),),
        TextButton(onPressed: animatedLoop, child: const Text('Random Color & Bold Loop'),),
        TextButton(onPressed: animatedLoop2, child: const Text('Random Color & Bold Size'),)
      ],
    ),
  );
}


class AnimationIcon extends StatefulWidget {
  const AnimationIcon({Key? key}) : super(key: key);

  @override
  State<AnimationIcon> createState() => _AnimationIconState();
}

class _AnimationIconState extends State<AnimationIcon> with TickerProviderStateMixin{
  late AnimationController controller;
  bool isPlay = false;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) => Center(
    child: GestureDetector(
      onTap: () {
        if(isPlay == false) {
          controller.forward();
          isPlay = true;
        } else {
          controller.reverse();
          isPlay = false;
        }
      },
      child: AnimatedIcon(
        icon: AnimatedIcons.play_pause,
        progress: controller,
        size: 120,
      ),
    ),
  );
}