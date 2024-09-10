// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

class CrossfadeAnimate extends StatelessWidget {
  static const String title = 'Animated CrossFade';

  const CrossfadeAnimate({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        primaryColor: Colors.red,
        scaffoldBackgroundColor: Colors.red.shade100,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(primary: Colors.red)
        )
      ),
      home: const CrossFade(),
    );
  }
}

class CrossFade extends StatefulWidget {
  const CrossFade({Key? key}) : super(key: key);

  @override
  State<CrossFade> createState() => _CrossFadeState();
}

class _CrossFadeState extends State<CrossFade> {
  int index = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: index,
        children: const [
          BasicPage(),
          AdvancedPage()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (index) => setState(() => this.index = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.airplay_outlined),
            label: 'Basic'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_play_outlined),
            label: 'Advanced'
          )
        ]
      ),
    );
  }
}


class AdvancedPage extends StatefulWidget {
  const AdvancedPage({Key? key}) : super(key: key);

  @override
  State<AdvancedPage> createState() => _AdvancedPageState();
}

class _AdvancedPageState extends State<AdvancedPage> {
  bool isSmallerImage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(CrossfadeAnimate.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedCrossFade(
              firstChild: SizedBox(
                width: 250,
                height: 250,
                child: Image.asset(
                  'https://source.unsplash.com/featured/?light',
                  fit: BoxFit.cover,
                ),
              ),
              secondChild: const CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage(
                  'https://source.unsplash.com/featured/?dark',
                ),
              ),
              crossFadeState: isSmallerImage ? CrossFadeState.showSecond : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 3000),
              layoutBuilder: (topChild, topChildKey, bottomChild, bottomChildKey) => Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    key: bottomChildKey,
                    child: bottomChild,
                    top: 0.0,
                  ),
                  Positioned(
                    key: topChildKey,
                    child: topChild
                  )
                ],
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                maximumSize: const Size(double.infinity, 50)
              ),
              child: const Text(
                'Toggle Image',
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () => setState(() => isSmallerImage = !isSmallerImage)
            )
          ],
        ),
      ),
    );
  }
}

class BasicPage extends StatefulWidget {
  const BasicPage({Key? key}) : super(key: key);

  @override
  State<BasicPage> createState() => _BasicPageState();
}

class _BasicPageState extends State<BasicPage> {
  bool isFollowing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(CrossfadeAnimate.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                backgroundImage: NetworkImage('https://source.unsplash.com/featured/?face'),
                radius: 100,
              ),
              const SizedBox(height: 32),
              AnimatedCrossFade(
                firstChild: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50)
                  ),
                  child: const Text(
                    'Follow',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () => setState(() => isFollowing = true)
                ),
                secondChild: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50)
                  ),
                  child: const Text(
                    'Unfollow',
                    style: TextStyle(fontSize: 20, color: Colors.red),
                  ),
                  onPressed: () => setState(() => isFollowing = false) 
                ),
                crossFadeState: isFollowing ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                duration: const Duration(milliseconds: 3000),
                reverseDuration: const Duration(milliseconds: 600),
              )
            ],
          ),
        ),
      ),
    );
  }
}