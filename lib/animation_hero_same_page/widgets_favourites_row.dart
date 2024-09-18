/*
import 'package:check_animation/Animation%20Hero%20Same%20Page/model_user.dart';
import 'package:flutter/material.dart';

class FavouritesRowWidget extends StatefulWidget {
  final ScrollController controller;
  final ScrollController gridController;
  final List<SidekickBuilderDelegate<User>> delegates;

  const FavouritesRowWidget({
    super.key,
    required this.controller,
    required this.gridController,
    required this.delegates,
  });

  @override
  State<FavouritesRowWidget> createState() => _FavouritesRowWidgetState();
}

class _FavouritesRowWidgetState extends State<FavouritesRowWidget> {
  get controller => null;
  get delegates => null;
  get gridController => null;

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        controller: controller,
        scrollDirection: Axis.horizontal,
        child: Row(
          children: delegates.isEmpty
              ? [Text('Add someone as favourite')]
              : delegates.map((delegate) {
                  final user = delegate.message;

                  return delegate.build(
                    context,
                    buildUser(context, user),
                    animationBuilder: (animation) => CurvedAnimation(
                      parent: animation,
                      curve: FlippedCurve(Curves.ease),
                    ),
                  );
                }).toList(),
        ),
      );

  Widget buildUser(BuildContext context, User user) => GestureDetector(
        onTap: () async {
          final value = gridController.position.maxScrollExtent;
          await gridController.animateTo(
            value,
            curve: Curves.easeIn,
            duration: Duration(milliseconds: 100),
          );

          SidekickTeamBuilder.of<User>(context).move(user);
        },
        child: Card(
          elevation: 4,
          child: FittedBox(
            child: Container(
              padding: EdgeInsets.all(4),
              child: CircleAvatar(
                radius: 16,
                backgroundImage: AssetImage(user.imageUrl),
                backgroundColor: Colors.white,
              ),
            ),
          ),
        ),
      );
}
*/