import 'package:material_ui/material_ui.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/lib/core/models/todo.dart';

class AppStorage {
  static late SharedPreferences prefs;
  static late Box box;

  /// Initialising the hive and shared preferences
  static Future<void> init() async {
    await Hive.initFlutter();
    box = await Hive.openBox("appBox");
    prefs = await SharedPreferences.getInstance();
  }

  /// Returns the current theme of the app
  static ThemeMode getThemeMode() {
    final String themeVal = prefs.getString("themeMode") ?? "system";
    return ThemeMode.values.firstWhere(
      (themeStr) => themeStr.name == themeVal,
      orElse: () => ThemeMode.system,
    );
  }

  /// Sets the theme to the selected one
  static Future<void> setThemeMode(ThemeMode mode) =>
      prefs.setString('themeMode', mode.name);

  /// Returns current font stored as per the user
  static String getCurrFont() => prefs.getString("currFontFamily") ?? "Outfit";

  static Future<void> setAppFont(String fontName) =>
      prefs.setString('currFontFamily', fontName);

  /// Returns the seed color
  static int getSeedColor() => prefs.getInt("currSeedColor") ?? 0xFF6750A4;

  /// Sets the user theme to the currently selected value and replaces it in
  /// the app settings.
  static Future<void> setSeedColor(int value) =>
      prefs.setInt("currSeedColor", value);

  /// Returns if the current user settings to use dynamic theme
  static bool getWillUseSeedColor() => prefs.getBool("useDynamicTheme") ?? true;

  /// Sets if the user wants to use dynamic theme
  static Future<void> setWillUseSeedColor(bool val) =>
      prefs.setBool("useDynamicTheme", val);

  /// Returns the todos stored in the database
  static List<Todo> getTodos() {
    List<Todo> todos = [];
    final dynamicTodos = box.get('todos', defaultValue: []) as List;
    if (dynamicTodos.isNotEmpty) {
      for (var todo in dynamicTodos) {
        todos.add(Todo.fromJson(Map<String, dynamic>.from(todo)));
      }
    }
    return todos;
  }

  /// Adds todo to the database.
  ///
  // saves a todo.
  static void saveTodos(List<Todo> todos) =>
      box.put("todos", todos.map((t) => t.toJson()).toList());
}
