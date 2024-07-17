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
      title: 'ProgressIndicator',
      subTitle: 'A Generals and controlled indicators ',
      link: '/progress',
      icon: Icons.refresh_rounded),
  MenuItem(
      title: 'Animated',
      subTitle: 'A Animated container',
      link: '/animated',
      icon: Icons.panorama_horizontal),
  MenuItem(
      title: 'Ui Controls + titles',
      subTitle: 'A severals controlleres with differents titles',
      link: '/ui-controls',
      icon: Icons.car_rental_outlined),
  MenuItem(
      title: 'Snackbars',
      subTitle: 'A Snackbars container',
      link: '/snackbars',
      icon: Icons.info_outline),
  MenuItem(
      title: 'Introduction Tutorial App',
      subTitle: 'A Tuturial for how to use the app',
      link: '/tutorial',
      icon: Icons.accessibility_new_rounded),
  MenuItem(
      title: 'Infinite Scroll',
      subTitle: 'An Infinite scroll for the app',
      link: '/infinite',
      icon: Icons.circle_rounded)
];
