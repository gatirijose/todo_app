import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:todo_app/lib/core/providers/seed_color_provider.dart';

class AccentColorSettingsCard extends ConsumerStatefulWidget {
  const new({super.key});

  @override
  ConsumerState<AccentColorSettingsCard> createState() =>
      _AccentColorSettingsCardState();
}

class _AccentColorSettingsCardState
    extends ConsumerState<AccentColorSettingsCard> {
  @override
  Widget build(BuildContext context) {
    final seedColor = ref.watch(seedColorProvider);
    return Card(
      child: Wrap(
        spacing: 8,
        children: [
          for (final materialColor in [
            Colors.blue,
            Colors.orange,
            Colors.deepOrange,
            Colors.green,
            Colors.teal,
            Colors.purple,
            Colors.deepPurple,
          ])
            GestureDetector(
              onTap: () => ref
                  .read(seedColorProvider.notifier)
                  .setSeedColor(materialColor),
              child: CircleAvatar(
                backgroundColor: materialColor,
                radius: 22,
                child: seedColor.toARGB32() == materialColor.toARGB32()
                    ? const Icon(Icons.check, color: Colors.white)
                    : null,
              ),
            ),
        ],
      ),
    );
  }
}
