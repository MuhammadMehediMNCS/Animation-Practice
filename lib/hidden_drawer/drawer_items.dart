import 'package:animation_work/hidden_drawer/drawer_item.dart';
import 'package:flutter/material.dart';

class DrawerItems {
  static const home = DrawerItem(title: 'Home', icon: Icons.home_outlined);
  static const explore = DrawerItem(title: 'Explore', icon: Icons.explore_outlined);
  static const favourites = DrawerItem(title: 'Favourites', icon: Icons.favorite_outline_outlined);
  static const messages = DrawerItem(title: 'Messages', icon: Icons.mail_outline);
  static const profile = DrawerItem(title: 'Profile', icon: Icons.person_outline);
  static const settings = DrawerItem(title: 'Settings', icon: Icons.settings_outlined);
  static const logout = DrawerItem(title: 'Logout', icon: Icons.logout_outlined);

  static final List<DrawerItem> all = [
    home,
    explore,
    favourites,
    messages,
    profile,
    settings,
    logout
  ];
}