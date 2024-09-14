import 'package:animation_work/hidden_drawer/drawer_page.dart';
import 'package:animation_work/hidden_drawer/widget_drawer.dart';
import 'package:flutter/material.dart';

class HiddenDrawer extends StatelessWidget {
  static const String title = '';

  const HiddenDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.white,
        primaryColor:const Color.fromRGBO(21, 30, 61, 1)
      ),
      home: const HiddenDrawerDesign(),
    );
  }
}

class HiddenDrawerDesign extends StatefulWidget {
  const HiddenDrawerDesign({super.key});

  @override
  State<HiddenDrawerDesign> createState() => _HiddenDrawerDesignState();
}

class _HiddenDrawerDesignState extends State<HiddenDrawerDesign> {
  late double xOffset;
  late double yOffset;
  late double scaleFactor;
  late bool isDrawerOpen;
  bool isDragging = false;

  @override
  void initState() {
    super.initState();

    xOffset = 0;
    yOffset = 0;
    scaleFactor = 1;
    isDrawerOpen = false;

    closeDrawer();
  }

  void openDrawer() => setState(() {
    xOffset = 220;
    yOffset = 150;
    scaleFactor = 0.6;
    isDrawerOpen = false;
  });

  void closeDrawer() => setState(() {
    xOffset = 0;
    yOffset = 0;
    scaleFactor = 1;
    isDrawerOpen = true;
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: [
          buildDrawer(),
          buildPage()
        ],
      ),
    );
  }

  Widget buildDrawer() => const SafeArea(
    child: DrawerWidget()
  );

  Widget buildPage() {
    return GestureDetector(
      onTap: closeDrawer,
      onHorizontalDragStart: (details) => isDragging = true,
      onHorizontalDragUpdate: (details) {
        if(!isDragging) return;

        const delta = 1;
        if(details.delta.dx > delta) {
          openDrawer();
        } else if(details.delta.dx < -delta) {
          closeDrawer();
        }
        
        isDragging = false;
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        transform: Matrix4.translationValues(xOffset, yOffset, 0)
          ..scale(scaleFactor),
        child: AbsorbPointer(
          absorbing: isDrawerOpen,
          child: Container(
            color: isDrawerOpen ? Theme.of(context).primaryColor : Colors.white12,
            child: DrawerPage(openDrawer: openDrawer)
          )
        )
      ),
    );
  }
}