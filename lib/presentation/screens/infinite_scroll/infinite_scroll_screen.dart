import 'package:flutter/material.dart';

class InfiniteScrollScreen extends StatelessWidget {
  static const String name = 'infite_screen';
  const InfiniteScrollScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Infinite Scroll screen')),
      body: Center(
        child: Text('infinite scroll screen'),
      ),
    );
  }
}
