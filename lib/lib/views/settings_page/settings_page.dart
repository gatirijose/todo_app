import 'package:material_ui/material_ui.dart';
import 'package:todo_app/lib/views/settings_page/widgets/accent_color_settings_card.dart';
import 'package:todo_app/lib/views/settings_page/widgets/theme_settings_card.dart';
import 'package:todo_app/lib/views/settings_page/widgets/dynamic_theme_switch_card.dart';
import 'package:todo_app/lib/views/settings_page/widgets/typography_settings_card.dart';

class SettingsPage extends StatefulWidget {
  const new({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          title: Text("Settings"),
          stretch: true,
          pinned: true,
        ),
        SliverPadding(
          padding: EdgeInsetsGeometry.all(16),
          sliver: SliverList.list(
            children: [
              Text(
                "Appearance settings",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: ThemeSettingsCard(),
              ),
              Text(
                'Seed Color (when Material You off)',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: 8),
              DynamicThemeSwitchCard(),
              SizedBox(height: 8),
              AccentColorSettingsCard(),

              Padding(
                padding: EdgeInsetsGeometry.only(top: 16, bottom: 16),
                child: Text(
                  "Typography",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              TypographySettingsCard(),
            ],
          ),
        ),
      ],
    );
  }
}
