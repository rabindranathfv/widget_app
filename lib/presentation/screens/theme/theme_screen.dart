import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_app/presentation/providers/theme_provider.dart';

class ThemeScreen extends ConsumerWidget {
  static const name = 'theme_screen';
  const ThemeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Screen'),
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
      body: _ThemeView(),
    );
  }
}

class _ThemeView extends ConsumerWidget {
  const _ThemeView({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    final List<Color> colors = ref.watch(colorListProvider);
    final int selectColorTheme = ref.watch(selectedColorProvider);
    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (BuildContext context, int index) {
        final Color selectedColor = colors[index];
        return RadioListTile(
          title: Text('This color', style: TextStyle(color: selectedColor)),
          subtitle: Text('${selectedColor.value}'),
          activeColor: selectedColor,
          value: index,
          groupValue: selectColorTheme,
          onChanged: (value) {
            ref.read(selectedColorProvider.notifier).update((state) => value!);
            // ref.read(selectedColorProvider.notifier).state = value!;
          },
        );
      },
    );
  }
}
