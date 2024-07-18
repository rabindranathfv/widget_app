import 'package:flutter/material.dart';

class CounterScreen extends StatelessWidget {
  static const name = 'counter_screen';
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter state with RIVERPOD'),
      ),
      body: Center(
        child: Text('contador', style: Theme.of(context).textTheme.titleLarge),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: FloatingActionButton(
              heroTag: 'floatingButtonChangeCurve',
              onPressed: () {},
              child: const Icon(Icons.refresh),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: FloatingActionButton(
              heroTag: 'floatingButtonPreviousShape',
              onPressed: () {},
              child: const Icon(Icons.remove),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: FloatingActionButton(
              heroTag: 'floatingButtonChangeShape',
              onPressed: () {},
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
