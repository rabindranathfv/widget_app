import 'package:flutter/material.dart';
import 'package:widget_app/config/menu/menu_items.dart';
import 'package:widget_app/presentation/screens/buttons/buttons_screnn.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: const Text('Flutter + Material You')),
      body: const _homeView(),
    );
  }
}

class _homeView extends StatelessWidget {
  const _homeView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(appMenuItems[index].title ),
          subtitle: Text(appMenuItems[index].subTitle),
          leading: Icon(appMenuItems[index].icon, color: colors.primary),
          trailing: Icon( Icons.arrow_forward_ios_rounded, color: colors.primary),
          onTap: () {
            print('Tapped on ${appMenuItems[index].link}');
            Navigator.pushNamed(context, appMenuItems[index].link);
            },
          );
      },
    );
  }
}
