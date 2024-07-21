import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_app/presentation/providers/counter_provider.dart';
import 'package:widget_app/presentation/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {
  static const name = 'counter_screen';
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);
    final isDarkMode = ref.watch(themeProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter state with RIVERPOD'),
        actions: [
          IconButton(
            icon: isDarkMode
                ? const Icon(Icons.dark_mode_outlined)
                : const Icon(Icons.light_mode_outlined),
            onPressed: () {
              ref.read(themeProvider.notifier).update((state) => !state);
            },
          )
        ],
      ),
      body: Center(
        child: Text('contador ${counter}',
            style: Theme.of(context).textTheme.titleLarge),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: FloatingActionButton(
              heroTag: 'floatingButtonChangeCurve',
              onPressed: () {
                // ref.read(counterProvider.notifier).update((state) => 0);
                ref.read(counterProvider.notifier).state = 0;
              },
              child: const Icon(Icons.refresh),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: FloatingActionButton(
              heroTag: 'floatingButtonPreviousShape',
              onPressed: () {
                // ref.read(counterProvider.notifier).update((state) => state - 1);
                if (counter <= 0) return;
                ref.read(counterProvider.notifier).state -= 1;
              },
              child: const Icon(Icons.remove),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: FloatingActionButton(
              heroTag: 'floatingButtonChangeShape',
              onPressed: () {
                // ref.read(counterProvider.notifier).update((state) => state + 1);
                ref.read(counterProvider.notifier).state += 1;
              },
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
