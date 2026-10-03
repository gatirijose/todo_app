import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/lib/core/app_storage.dart';

const fontMap = {
  'Outfit': 'Outfit',
  'Inter': 'Inter',
  'Plus Jakarta': 'Plus Jakarta Sans',
  'Poppins': 'Poppins',
  'DM Sans': 'DM Sans',
};

class FontSettingsProvider extends Notifier<String> {
  @override
  String build() => AppStorage.getCurrFont();

  void setFont(String fontName) {
    AppStorage.setAppFont(fontName);
  }

  TextTheme textTheme(TextTheme baseTheme) {
    switch (state) {
      case "Inter":
        return GoogleFonts.interTextTheme(baseTheme);
      case 'Plus Jakarta':
        return GoogleFonts.plusJakartaSansTextTheme(baseTheme);
      case 'Poppins':
        return GoogleFonts.poppinsTextTheme(baseTheme);
      case 'DM Sans':
        return GoogleFonts.dmSansTextTheme(baseTheme);
      default:
        return GoogleFonts.outfitTextTheme(baseTheme);
    }
  }
}

final fontSettingsProvider = NotifierProvider<FontSettingsProvider, String>(
  FontSettingsProvider.new,
);
