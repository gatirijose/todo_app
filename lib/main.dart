import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:todo_app/lib/core/app_storage.dart';
import 'package:todo_app/lib/core/providers/font_settings_provider.dart';
import 'package:todo_app/lib/core/providers/seed_color_provider.dart';
import 'package:todo_app/lib/core/providers/theme_provider.dart';
import 'package:todo_app/lib/core/providers/use_dynamic_provider.dart';
import 'package:todo_app/lib/views/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppStorage.init();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final seedColor = ref.watch(seedColorProvider);
    final _ = ref.watch(fontSettingsProvider);
    final appFont = ref.read(fontSettingsProvider.notifier);
    final canUseDynamicFont = ref.watch(useDynamicProvider);
    return DynamicColorBuilder(
      builder: (lightDynamic, darkDynamic) {
        ColorScheme lightColorSceme;
        ColorScheme darkColorSceme;
        if (canUseDynamicFont && lightDynamic != null && darkDynamic != null) {
          lightColorSceme = lightDynamic;
          darkColorSceme = darkDynamic;
        } else {
          lightColorSceme = ColorScheme.fromSeed(seedColor: seedColor);
          darkColorSceme = ColorScheme.fromSeed(
            seedColor: seedColor,
            brightness: Brightness.dark,
          );
        }
        ThemeData buildTheme(ColorScheme scheme) {
          final baseTheme = ThemeData(colorScheme: scheme, useMaterial3: true);
          return baseTheme.copyWith(
            textTheme: appFont.textTheme(baseTheme.textTheme),
            appBarTheme: AppBarTheme(
              backgroundColor: scheme.surfaceContainer,
              scrolledUnderElevation: 0,
            ),
            cardTheme: CardThemeData(
              color: scheme.surfaceContainerHigh,
              elevation: 0,
            ),
          );
        }

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Material UI Todo App",
          theme: buildTheme(lightColorSceme),
          darkTheme: buildTheme(darkColorSceme),
          home: HomeScreen(),
          themeMode: themeMode,
        );
      },
    );
  }
}
