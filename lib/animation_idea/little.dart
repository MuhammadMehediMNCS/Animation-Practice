import 'package:flutter/material.dart';
import 'package:page_flip_builder/page_flip_builder.dart';

class Knowledge extends StatelessWidget {
  const Knowledge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ShakeOrBounceAnimation()
    );
  }
}


// For Simple Animation One.

class Simple_Animations_Tween extends StatefulWidget {
  const Simple_Animations_Tween({Key? key}) : super(key: key);

  @override
  State<Simple_Animations_Tween> createState() => _Simple_Animations_TweenState();
}

class _Simple_Animations_TweenState extends State<Simple_Animations_Tween> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _sizeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 3));
    _sizeAnimation = Tween<double>(begin: 50.0, end: 200.0).animate(_controller);
    _controller.forward();
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Building Simple Animations with the Tween'),
      ),
    );
  }
}

// For Simple Animation Two. Color problem (ColorTween()).

class Complex_Staggered_Animation extends StatefulWidget {
  const Complex_Staggered_Animation({Key? key}) : super(key: key);

  @override
  State<Complex_Staggered_Animation> createState() => _Complex_Staggered_AnimationState();
}

class _Complex_Staggered_AnimationState extends State<Complex_Staggered_Animation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> sizeAnimation;
  late Animation<Color> colorAnimation;
  late Animation<double> helloAnimation;
  late Animation<Offset> messageAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: Duration(seconds: 5));
    sizeAnimation = Tween(begin: 50.0, end: 200.0).animate(CurvedAnimation(parent: _controller, curve: Interval(0.0, 0.5, curve: Curves.decelerate)));
    colorAnimation = Tween<Color>(begin: Colors.green, end: Colors.amber).animate(CurvedAnimation(parent: _controller, curve: Interval(0.5, 1.0)));
    helloAnimation = Tween<double>(begin: 20.0, end: 0.0).animate(CurvedAnimation(parent: _controller, curve: Interval(0.5, 0.7, curve: Curves.easeIn)));
    messageAnimation = Tween<Offset>(begin: Offset(16.0, 0.0), end: Offset.zero).animate(CurvedAnimation(parent: _controller, curve: Interval(0.7, 1.0, curve: Curves.ease)));
    _controller.forward();
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        //brightness: Brightness.light,
        backgroundColor: Colors.white,
        elevation: 3.0,
      ),
      body: Center(
        child: CircleAvatar(
          radius: sizeAnimation.value,
          backgroundColor: colorAnimation.value,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FadeTransition(
                opacity: helloAnimation,
                child: const Text(
                  'Hello!',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              SlideTransition(
                position: messageAnimation,
                child: const Text(
                  'This is Staggered Amination demo',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


// For Simple Animation Three.

class Routing_Animation extends StatefulWidget {
  const Routing_Animation({Key? key}) : super(key: key);

  @override
  State<Routing_Animation> createState() => _Routing_AnimationState();
}

class _Routing_AnimationState extends State<Routing_Animation> {

  /* Run the Commands in terminal for <PageFlipBuilderState>.
      flutter pub add page_flip_builder
      flutter pub get
  */

  final pageFlipKey = GlobalKey<PageFlipBuilderState>();

  @override
  Widget build(BuildContext context) {
    return PageFlipBuilder(
      key: pageFlipKey,
      frontBuilder: (_) => PageOne(
        onFlip: () => pageFlipKey.currentState
      ),
      backBuilder: (_) => PageTwo(
        onFlip: () => pageFlipKey.currentState
      ),
      maxTilt: 0.005,
      maxScale: 0.6,
    );
  }
}


class PageOne extends StatelessWidget {
  final VoidCallback onFlip;
  
  const PageOne({Key? key, required this.onFlip}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: const Text('Flutter Page Flip demo'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: const Center(
        child: Text(
          'Page 1',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        onPressed: onFlip,
        child: const Icon(Icons.compare_arrows_rounded)
      ),
    );
  }
}

class PageTwo extends StatelessWidget {
  final VoidCallback onFlip;
  
  const PageTwo({Key? key, required this.onFlip}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: const Text('Flutter Page Flip demo'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: const Center(
        child: Text(
          'Page 2',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        onPressed: onFlip,
        child: const Icon(Icons.compare_arrows_rounded)
      ),
    );
  }
}



// For Simple Animation Four.



class ShakeOrBounceAnimation extends StatefulWidget {
  const ShakeOrBounceAnimation({Key? key}) : super(key: key);

  @override
  State<ShakeOrBounceAnimation> createState() => _ShakeOrBounceAnimationState();
}

class _ShakeOrBounceAnimationState extends State<ShakeOrBounceAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shake Animation demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TweenAnimationBuilder(
              curve: Curves.bounceOut,
              tween: Tween(begin: 1.0, end: 0.0),
              duration: const Duration(milliseconds: 3000),
              builder: (context, value, child) {

                // horizontal disposition of the widget.

                return Transform.translate(
                  offset: const Offset(0.0 * 500, 0.0),
                  child: child,
                );
              },
              child: const CircleAvatar(
                radius: 60,
                backgroundColor: Colors.purpleAccent,
              )
            ),
            const SizedBox(height: 20),
            TweenAnimationBuilder(
              curve: Curves.bounceOut,
              tween: Tween(begin: 1.0, end: 0.0),
              duration: const Duration(milliseconds: 1000),
              builder: (context, value, child) {
                return Transform.translate(
                  offset: const Offset(0.0, 0.0 * 100),
                  child: child,
                );
              },
              child: Container(
                width: 60,
                height: 100,
                color: Colors.blueAccent,
              )
            ),
            const SizedBox(height: 20),
            TweenAnimationBuilder(
              curve: Curves.bounceOut,
              tween: Tween(begin: 1.0, end: 0.0),
              duration: const Duration(milliseconds: 500),
              builder: (context, value, child) {
                return Transform.translate(
                  offset: const Offset(0.0 * 60, 0.0),
                  child: child,
                );
              },
              child: const Text(
                'Hello!',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              )
            ),
            const SizedBox(height: 20),
            TweenAnimationBuilder(
              curve: Curves.bounceOut,
              tween: Tween(begin: 1.0, end: 0.0),
              duration: const Duration(milliseconds: 1200),
              builder: (context, value, child) {
                return Transform.translate(
                  offset: const Offset(0.0, 0.0 * 300),
                  child: child,
                );
              },
              child: IconButton(
                icon: const Icon(Icons.abc),
                color: Colors.red,
                onPressed: () {}
              )
            )
          ],
        ),
      ),
    );
  }
}