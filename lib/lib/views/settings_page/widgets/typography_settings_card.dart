import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsGeometry.only(top: 8, left: 8),
            child: Text(
              "Default app font",
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          RadioGroup<String>(
            groupValue: currentFont,
            onChanged: (value) {
              ref.watch(fontSettingsProvider.notifier).setFont(value!);
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 8,
              children: fontMap.keys.map((name) {
                return RadioListTile<String>(
                  value: name,
                  title: Text(
                    name,
                    style: GoogleFonts.getFont(fontMap[name]!),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
