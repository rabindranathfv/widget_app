import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title,
    required this.subTitle,
    required this.link,
    required this.icon,
  });
}

const appMenuItems = <MenuItem>[
  MenuItem(
      title: 'Buttons',
      subTitle: 'Severals flutter btns',
      link: '/buttons',
      icon: Icons.smart_button_outlined),
  MenuItem(
      title: 'Cards',
      subTitle: 'A styled container',
      link: '/cards',
      icon: Icons.credit_card),
  MenuItem(
      title: 'Animated',
      subTitle: 'A Animated container',
      link: '/animated',
      icon: Icons.panorama_horizontal),
  MenuItem(
      title: 'Tutorial',
      subTitle: 'A Tuturial container',
      link: '/tutorial',
      icon: Icons.play_circle_fill_sharp)
];
