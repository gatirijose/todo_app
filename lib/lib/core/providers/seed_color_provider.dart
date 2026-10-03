import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/lib/core/app_storage.dart';

class SeedColorProvider extends Notifier<Color> {
  @override
  Color build() => Color(AppStorage.getSeedColor());
  void setSeedColor(Color color) {
    AppStorage.setSeedColor(color.toARGB32());
  }
}

final seedColorProvider = NotifierProvider<SeedColorProvider, Color>(
  SeedColorProvider.new,
);
