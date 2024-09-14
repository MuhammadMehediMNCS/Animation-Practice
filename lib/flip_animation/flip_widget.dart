import 'package:flutter/material.dart';
import 'dart:math';


class FlipWidget extends StatefulWidget {
  final Widget form;
  final Widget to;
  final AnimationStatus animationStatus;

  //animationStatus: flipped ? AnimationStatus.forward : AnimationStatus.reverse

  const FlipWidget({
    Key? key,
    required this.form,
    required this.to,
    required this.animationStatus
  }) : super(key: key);

  @override
  State<FlipWidget> createState() => _FlipWidgetState();
}

class _FlipWidgetState extends State<FlipWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late CurvedAnimation animationCurve;
  
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this, duration: Duration(seconds: 1)
    );

    final flipCurve = Cubic(0.455, 0.030, 0.515, 0.955);
    animationCurve = CurvedAnimation(parent: _controller, curve: flipCurve);
  }

  @override
  void dispose() {
    super.dispose();

    _controller.dispose();
  }

  @override
  void didUpdateWidget(FlipWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if(oldWidget.animationStatus != widget.animationStatus) {
      switch(widget.animationStatus) {
        case AnimationStatus.forward:
          _controller.reset();
          _controller.forward();
          break;
        case AnimationStatus.reverse:
          _controller.reverse();
          break;
        default:
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
    animation: _controller,
    builder: (BuildContext context, child) {
      final Widget child = _controller.value <= 0.5 && widget.animationStatus != AnimationStatus.completed
        ? widget.form
        : widget.to;

      Widget mirror(Widget child) => _controller.value <= 0.5
        ? Container(child: child)
        : Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationX(pi),
            child: child,
          );

      return slideUpTransition(
        child: alignmentRotateTransition(
          child: mirror(child)
        )
      );
    }
  );

  Widget slideUpTransition({Widget? child}) {
    final Tween<Offset> slideUp = Tween<Offset>(begin: Offset.zero, end: Offset(0.0, -1.0));
    
    return SlideTransition(
      position: slideUp.animate(animationCurve),
      child: child,
    );
  }

  Widget alignmentRotateTransition({Widget? child}) {
    final alignTransition = AlignmentTween(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter
    );

    return Transform(
      alignment: alignTransition.animate(animationCurve).value,
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001)
        ..rotateX(_controller.value * pi),
      child: child,
    );
  }
}