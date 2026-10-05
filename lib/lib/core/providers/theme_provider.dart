import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/lib/core/app_storage.dart';

class ThemeProvider extends Notifier<ThemeMode> {
  @override
  ThemeMode build() => AppStorage.getThemeMode();

  void setTheme(ThemeMode mode) {
    AppStorage.setThemeMode(mode);
  }
}

final themeModeProvider = NotifierProvider<ThemeProvider, ThemeMode>(
  ThemeProvider.new,
);
