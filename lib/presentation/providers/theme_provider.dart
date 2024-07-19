import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_app/config/theme/app_theme.dart';

final themeProvider = StateProvider<bool>((ref) => false);

// TODO: InmutableProvider
final colorListProvider = Provider((ref) => colorlist);

final selectedColorProvider = StateProvider<int>((ref) => 0);

// Parameters <Controller class with methods, instance of StateNotifier Class>
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>((ref) {
  return ThemeNotifier();
});

class ThemeNotifier extends StateNotifier<AppTheme> {
  // generate a state of appTheme with selected color 0 and isDarkMode false
  ThemeNotifier() : super(AppTheme());

  void toggleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColorIndex(int colorIndex) {
    state = state.copyWith(selectedColor: colorIndex);
  }
}