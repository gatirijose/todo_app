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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsGeometry.only(bottom: 8),
              child: Text("Only works if dynamic color is disabled"),
            ),
            Wrap(
              spacing: 12,

              children: [
                for (final materialColor in [
                  Colors.brown,
                  Colors.grey,
                  Colors.blue,
                  Colors.blueGrey,
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
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: CircleAvatar(
                        backgroundColor: materialColor,
                        radius: 22,
                        child: seedColor.toARGB32() == materialColor.toARGB32()
                            ? const Icon(Icons.check, color: Colors.white)
                            : null,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
