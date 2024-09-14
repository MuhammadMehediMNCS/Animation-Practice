import 'package:flutter/material.dart';

class DrawerPage extends StatefulWidget {
  final VoidCallback openDrawer;

  const DrawerPage({super.key, required this.openDrawer});

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: widget.openDrawer
        ),
        title: const Text('Home Page'),
      ),
    );
  }
}