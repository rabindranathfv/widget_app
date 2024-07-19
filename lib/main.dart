import 'package:flutter/material.dart';
import 'package:widget_app/config/router/app_router.dart';
import 'package:widget_app/config/theme/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_app/presentation/providers/theme_provider.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    // final selectColorTheme = ref.watch(selectedColorProvider);
    // final selectedTheme = ref.watch(themeProvider);
    final appTheme = ref.watch(themeNotifierProvider);
    return MaterialApp.router(
      title: 'Flutter Widget App',
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme:
          AppTheme(selectedColor: appTheme.selectedColor, isDarkMode: appTheme.isDarkMode)
              .getTheme(),
    );
  }
}
