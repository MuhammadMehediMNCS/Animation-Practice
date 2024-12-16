import 'package:flutter/material.dart';
import 'dart:math';

class BalanceTransfer extends StatelessWidget {
  const BalanceTransfer({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BalanceTransferButton(),
    );
  }
}

class BalanceTransferButton extends StatefulWidget {
  const BalanceTransferButton({super.key});

  @override
  State<BalanceTransferButton> createState() => _BalanceTransferButtonState();
}

class _BalanceTransferButtonState extends State<BalanceTransferButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool isComplete = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // Listen for animation status changes
    _controller.addListener(() {
      setState(() {
        isComplete = _controller.value == 1.0; // Check if animation is complete
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onLongPressStart() {
    _controller.forward(); // Start animation
  }

  void _onLongPressEnd() {
    _controller.reverse(); // Reset animation
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('bKash Money Transfer'),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.bold),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.all(10.0),
            height: MediaQuery.of(context).size.height / 4,
            child: Text(
              isComplete ? "Successful" : "Transferring...",
              style: TextStyle(color: isComplete ? Colors.green : Colors.black, fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
          ),
          Center(
            child: GestureDetector(
              onLongPressStart: (_) => _onLongPressStart(),
              onLongPressEnd: (_) => _onLongPressEnd(),
              child: CustomPaint(
                size: const Size(300.0, 150.0),
                painter: DualArcPainter(_controller),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DualArcPainter extends CustomPainter {
  final AnimationController controller;

  DualArcPainter(this.controller) : super(repaint: controller);

  @override
  void paint(Canvas canvas, Size size) {
    const double innerStrokeWidth = 3.0;
    const double outerStrokeWidth = 10.0;

    // Paint for the inner arc
    final innerArcPaint = Paint()..color = Colors.black38;

    // Paint for the outer arc
    final outerArcPaint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = outerStrokeWidth;

    // Draw the inner arc
    final innerArcRect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height),
      radius: size.width / 2 - innerStrokeWidth / 2 - 5,
    );
    canvas.drawArc(innerArcRect, pi, pi, false, innerArcPaint);

    // Draw the outer arc based on animation progress
    final outerArcRect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height),
      radius: size.width / 2 + outerStrokeWidth / 2 + 5,
    );
    final sweepAngle = pi * controller.value; // Progressively reveal the arc
    canvas.drawArc(outerArcRect, pi, sweepAngle, false, outerArcPaint);

    // Add "Press and hold" text inside the inner arc
    const textSpan = TextSpan(
      text: "Press and hold",
      style: TextStyle(
        color: Colors.white,
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
      ),
    );

    final textPainter = TextPainter(
      text: textSpan,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();

    // Position the text at the center of the inner arc
    final textX = (size.width - textPainter.width) / 2;
    final textY = size.height / 2 - textPainter.height / 2;

    textPainter.paint(canvas, Offset(textX, textY));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // Repaint on animation updates
  }
}
