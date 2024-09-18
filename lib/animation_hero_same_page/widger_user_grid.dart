/*
import 'package:check_animation/Animation%20Hero%20Same%20Page/model_user.dart';
import 'package:flutter/material.dart';

class UserGridWidget extends StatefulWidget {
  final List<SidekickBuilderDelegate<User>> delegates;
  final ScrollController controller;
  final ScrollController rowController;

  const UserGridWidget({
    super.key,
    required this.delegates,
    required this.controller,
    required this.rowController,
  });

  @override
  State<UserGridWidget> createState() => _UserGridWidgetState();
}

class _UserGridWidgetState extends State<UserGridWidget> {
  get controller => null;
  get delegates => null;
  get rowController => null;

  @override
  Widget build(BuildContext context) => GridView.builder(
        controller: controller,
        itemCount: delegates.length + 1,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (BuildContext context, int index) {
          if (index == delegates.length) {
            return Container();
          } else {
            final delegate = delegates[index];
            final user = delegate.message;

            return delegate.build(
              context,
              GestureDetector(
                onTap: () async {
                  await SidekickTeamBuilder.of<User>(context).move(user);

                  final value = rowController.position.maxScrollExtent;
                  rowController.jumpTo(value);
                },
                child: buildUser(user),
              ),
              animationBuilder: (animation) => CurvedAnimation(
                parent: animation,
                curve: Curves.easeIn,
              ),
            );
          }
        },
      );

  Widget buildUser(User user) => Card(
        child: FittedBox(
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage(user.imageUrl),
                radius: 50,
              ),
              SizedBox(height: 16),
              Text(
                user.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ],
          ),
        ),
      );
}
*/