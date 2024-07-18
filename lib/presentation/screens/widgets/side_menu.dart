import 'package:flutter/material.dart';
import 'package:widget_app/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    final hasNotch = MediaQuery.of(context).viewPadding.top < 35;
    print('HASNOTCH: ${hasNotch}');

    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (value) {
        setState(() {
          navDrawerIndex = value;
        });
      },
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(20, hasNotch ? 10 : 20, 16, 10),
          child: Text('Main'),
        ),
        ...appMenuItems.sublist(0, 3).map(
              (menu) => NavigationDrawerDestination(
                  icon: Icon(menu.icon), label: Text(menu.title)),
            ),
        const Padding(
            padding: EdgeInsets.fromLTRB(20, 16, 28, 10), child: Divider()),
        const Padding(
          padding: EdgeInsets.fromLTRB(20, 16, 28, 10),
          child: Text('More Options'),
        ),
        ...appMenuItems.sublist(3).map(
              (menu) => NavigationDrawerDestination(
                  icon: Icon(menu.icon), label: Text(menu.title)),
            ),
      ],
    );
  }
}
