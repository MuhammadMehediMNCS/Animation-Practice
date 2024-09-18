/*
import 'package:check_animation/Animation%20Hero%20Same%20Page/data_users.dart';
import 'package:check_animation/Animation%20Hero%20Same%20Page/model_user.dart';
import 'package:check_animation/Animation%20Hero%20Same%20Page/widger_user_grid.dart';
import 'package:check_animation/Animation%20Hero%20Same%20Page/widgets_favourites_row.dart';
import 'package:flutter/material.dart';
import 'hero_main.dart';

class HomePage extends StatelessWidget {
  final controller = ScrollController();
  final gridController = ScrollController();

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.blueGrey[900],
        appBar: AppBar(
          title: Text(MyApp.title),
        ),
        body: SidekickTeamBuilder<User>(
          animationDuration: Duration(seconds: 1),
          initialSourceList: allUsers,
          builder: (context, sourceDelegates, delegates) => Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Expanded(
                  child: UserGridWidget(
                    delegates: sourceDelegates,
                    controller: gridController,
                    rowController: controller,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(8),
                  width: double.infinity,
                  height: 80,
                  child: Column(
                    children: [
                      Text(
                        'Favourites',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      FavouritesRowWidget(
                        delegates: delegates,
                        controller: controller,
                        gridController: gridController,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
}
*/