import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:todo_app/lib/core/providers/theme_provider.dart';

class ThemeSettingsCard extends ConsumerStatefulWidget {
  const new({super.key});

  @override
  ConsumerState<ThemeSettingsCard> createState() => _ThemeSettingsCardState();
}

class _ThemeSettingsCardState extends ConsumerState<ThemeSettingsCard> {
  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(themeModeProvider);
    return Card(
      child: RadioGroup<ThemeMode>(
        groupValue: themeMode,
        onChanged: (value) {
          ref.read(themeModeProvider.notifier).setTheme(value!);
        },

        child: Column(
          children: [
            RadioListTile<ThemeMode>(
              value: ThemeMode.light,
              title: Text("Light"),
            ),
            RadioListTile<ThemeMode>(
              value: ThemeMode.dark,
              title: Text("Dark"),
            ),
            RadioListTile<ThemeMode>(
              value: ThemeMode.system,
              title: Text("System"),
            ),
          ],
        ),
      ),
    );
  }
}
