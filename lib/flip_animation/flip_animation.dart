import 'package:animation_work/flip_animation/flip_widget.dart';
import 'package:flutter/material.dart';


class FlipImage extends StatelessWidget {
  final String appTitle = 'FlipAnimation';

  const FlipImage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      theme: ThemeData(
        primaryColor: Colors.red,
        textTheme: const TextTheme(
          button: TextStyle(fontSize: 18)
        )
      ),
      home: ImageFlipWidget(appTitle: appTitle),
    );
  }
}

class ImageFlipWidget extends StatefulWidget {
  final String appTitle;

  const ImageFlipWidget({Key? key, required this.appTitle}) : super(key: key);

  @override
  State<ImageFlipWidget> createState() => _ImageFlipWidgetState();
}

class _ImageFlipWidgetState extends State<ImageFlipWidget> {
  bool flipped = false;

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text(widget.appTitle),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlipWidget(
              form: Container(height: 100, width: 75, color: Colors.indigo,),
              to: Container(height: 100, width: 75, color: Colors.amber,),
              animationStatus: flipped ? AnimationStatus.forward : AnimationStatus.reverse
            ),
            const SizedBox(height: 30),
            buildButton(context),
          ],
        )
      ),
    );

  OutlinedButton buildButton(BuildContext context) {
    final String buttonText = flipped ? 'Reverse Flip' : 'Flip Forword';

    return OutlinedButton(
      child: Text(buttonText),
        onPressed: () {
          setState(() {
            flipped = !flipped;
          });
        },
    );
  }

  Widget image(String imagePath) => ClipRRect(
    borderRadius: BorderRadius.circular(8.0),
    child: Image.asset(
      imagePath,
      width: 300,
      height: 300,
      fit: BoxFit.cover,
    ),
  );
}