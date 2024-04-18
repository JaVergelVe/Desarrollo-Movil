import 'package:flutter/material.dart';

class MenuItems {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItems(
      {required this.title,
      required this.subTitle,
      required this.link,
      required this.icon});
}

const appMenuItems = <MenuItems>[
  MenuItems(
    title: 'button',
    subTitle: 'Buttones',
    link: '/buttons',
    icon: Icons.radio_button_checked,
  ),
  MenuItems(
    title: 'targeta',
    subTitle: 'Buttones',
    link: '/cards',
    icon: Icons.radio_button_checked,
  ),
  MenuItems(
    title: 'Progress',
    subTitle: ' progreso',
    link: '/progress',
    icon: Icons.local_drink,
  ),
  MenuItems(
    title: 'Snack',
    subTitle: ' snack',
    link: '/snack',
    icon: Icons.notification_add_rounded,
  ),
  MenuItems(
    title: 'Control',
    subTitle: ' control',
    link: '/control',
    icon: Icons.control_point,
  ),
  MenuItems(
    title: 'Infinity',
    subTitle: 'infinity',
    link: '/infinity',
    icon: Icons.info_outline,
  ),
];
