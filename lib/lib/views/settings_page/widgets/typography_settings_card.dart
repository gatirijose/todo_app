import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:todo_app/lib/core/providers/font_settings_provider.dart';

class TypographySettingsCard extends ConsumerStatefulWidget {
  const new({super.key});

  @override
  ConsumerState<TypographySettingsCard> createState() =>
      _TypographySettingsCardState();
}

class _TypographySettingsCardState
    extends ConsumerState<TypographySettingsCard> {
  @override
  Widget build(BuildContext context) {
    final currentFont = ref.watch(fontSettingsProvider);
    return Card(
      child: RadioGroup<String>(
        groupValue: currentFont,
        onChanged: (value) =>
            ref.read(fontSettingsProvider.notifier).setFont(value!),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 8,
          children: fontMap.keys.map((name) {
            return RadioListTile<String>(
              value: name,
              title: Text(name, style: TextStyle(fontFamily: fontMap[name])),
            );
          }).toList(),
        ),
      ),
    );
  }
}
