import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widget_app/config/menu/menu_items.dart';
import 'package:widget_app/presentation/screens/buttons/buttons_screnn.dart';
import 'package:widget_app/presentation/screens/widgets/side_menu.dart';

class HomeScreen extends StatefulWidget {
  static const String name = 'home_screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter + Material You')),
      body: const _HomeView(),
      drawer: SideMenu(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(appMenuItems[index].title),
          subtitle: Text(appMenuItems[index].subTitle),
          leading: Icon(appMenuItems[index].icon, color: colors.primary),
          trailing:
              Icon(Icons.arrow_forward_ios_rounded, color: colors.primary),
          onTap: () {
            // TODO: Metodos nativos de flutter
            // Way 1, compatible with goRouter
            // Navigator.of(context).push(
            //     MaterialPageRoute(builder: (context) => const ButtonsScreen()));
            // way 2, no compatible with goRouter
            // Navigator.pushNamed(context, appMenuItems[index].link);

            // TODO: Metodos de goRouter
            // way 3, adding name into goRouter and move into tthe screen
            // context.pushNamed( ButtonsScreen.name );

            context.push(appMenuItems[index].link);
          },
        );
      },
    );
  }
}
