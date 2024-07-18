import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_app/config/theme/app_theme.dart';

final themeProvider = StateProvider<bool>((ref) => false);

// TODO: InmutableProvider
final colorListProvider = Provider((ref) => colorlist);

final selectedColorProvider = StateProvider<int>((ref) => 0);
