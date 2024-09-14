import 'package:animation_work/hidden_drawer/drawer_items.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    child: Column(
      children: [
        buildDrawerItems(context)
      ],
    ),
  );

  Widget buildDrawerItems(BuildContext context) => Column(
    children: DrawerItems.all
        .map(
          (item) => ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            leading: Icon(item.icon, color: Colors.white,),
            title: Text(item.title),
            onTap: () {},
          )
        ).toList(),
  );
}