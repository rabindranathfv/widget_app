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

const aapMenuItems = <MenuItem>[
  MenuItem(
      title: 'Buttons',
      subTitle: 'Severals flutter btns',
      link: '/buttons',
      icon: Icons.smart_button_outlined),
  MenuItem(
      title: 'Cards',
      subTitle: 'A styled container',
      link: '/card',
      icon: Icons.credit_card)
];
