import 'package:flutter/material.dart';

class AppTutorialScreen extends StatelessWidget {
  static const String name = 'app_tutorial_screen';
  const AppTutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('app tutorial screen')),
      body: Center(
        child: Text('tutorial screen'),
      ),
    );
  }
}