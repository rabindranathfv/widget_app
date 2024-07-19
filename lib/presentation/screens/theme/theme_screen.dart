import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:widget_app/config/theme/app_theme.dart';
import 'package:widget_app/presentation/providers/theme_provider.dart';

class ThemeScreen extends ConsumerWidget {
  static const name = 'theme_screen';
  const ThemeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final isDarkMode = ref.watch(themeProvider);
    final appTheme = ref.watch(themeNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Screen'),
        actions: [
          IconButton(
            icon: appTheme.isDarkMode
                ? const Icon(Icons.dark_mode_outlined)
                : const Icon(Icons.light_mode_outlined),
            onPressed: () {
              ref.read(themeNotifierProvider.notifier).toggleDarkMode();
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
    // final int selectColorTheme = ref.watch(selectedColorProvider);
    final appTheme = ref.watch(themeNotifierProvider);
    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (BuildContext context, int index) {
        final Color selectedColor = colors[index];
        return RadioListTile(
          title: Text('This color', style: TextStyle(color: selectedColor)),
          subtitle: Text('${colors[appTheme.selectedColor].value}'),
          activeColor: colors[appTheme.selectedColor],
          value: index,
          groupValue: appTheme.selectedColor,
          onChanged: (value) {
            // ref.read(selectedColorProvider.notifier).update((state) => value!);
            // ref.read(selectedColorProvider.notifier).state = value!;
            // Update the selected color
            ref.read(themeNotifierProvider.notifier).changeColorIndex( value!);
          },
        );
      },
    );
  }
}
