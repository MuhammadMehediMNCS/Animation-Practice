
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CustomPageRoute extends PageRouteBuilder {
  final Widget child;
  final AxisDirection direction;

  //direction: AxisDirection.up

  CustomPageRoute({
    required this.child,
    this.direction = AxisDirection.right,
    RouteSettings? settings
  }) : super(
    transitionDuration: const Duration(seconds: 1),
    reverseTransitionDuration: const Duration(seconds: 1),
    pageBuilder: (context, animation, secondaryAnimation) => child,
    settings: settings
  );

  @override
  Widget BuildTransitions(BuildContext context, Animation<double> animation,
    Animation<double> secondaryAnimation, Widget child) => 
    ScaleTransition(
      scale: animation,
      child: child,
    );

    // Left to Right =>

    // SlideTransition(
    //   position: Tween<Offset>(
    //     begin: Offset(-1, 0),
    //     end: Offset.zero,
    //   ).animate(animation),
    //   child: child
    // );

    // Right to Left <=

    // SlideTransition(
    //   position: Tween<Offset>(
    //     begin: getBeginOffset(),
    //     end: Offset.zero,
    //   ).animate(animation),
    //   child: child
    // );

  Offset getBeginOffset() {
    switch (direction) {
      case AxisDirection.up:
        return const Offset(0, 1);
      case AxisDirection.down:
        return const Offset(0, -1);
      case AxisDirection.right:
        return const Offset(-1, 0);
      case AxisDirection.left:
        return const Offset(1, 0);
    }
  }
}


class BouncyPageRoute extends PageRouteBuilder {
  final Widget widget;

  BouncyPageRoute({required this.widget})
    : super(
        transitionDuration: const Duration(seconds: 2),
        transitionsBuilder: (BuildContext context,
          Animation<double> animation, Animation<double> secAnimation, Widget child) {
            animation = CurvedAnimation(parent: animation, curve: Curves.elasticInOut);

          return ScaleTransition(
            alignment: Alignment.center,
            scale: animation,
            child: child,
          );
          },
        pageBuilder: (BuildContext context,
          Animation<double> animation, Animation<double> secAnimation) {
          
        return widget;
        }
    );
}