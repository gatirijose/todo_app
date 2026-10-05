import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:todo_app/lib/core/providers/use_dynamic_provider.dart';

class DynamicThemeSwitchCard extends ConsumerStatefulWidget {
  const new({super.key});

  @override
  ConsumerState<DynamicThemeSwitchCard> createState() =>
      _DynamicThemeSwitchCardState();
}

class _DynamicThemeSwitchCardState
    extends ConsumerState<DynamicThemeSwitchCard> {
  @override
  Widget build(BuildContext context) {
    final useDynamicTheme = ref.watch(useDynamicProvider);
    return Card(
      child: SwitchListTile(
        title: Text("Dynamic Colors"),
        subtitle: Text(
          useDynamicTheme
              ? "On works on android 12+"
              : "Using your selected accent color",
        ),
        value: useDynamicTheme,
        onChanged: (value) =>
            ref.read(useDynamicProvider.notifier).toggleWillUseDynamicColor(),
      ),
    );
  }
}
