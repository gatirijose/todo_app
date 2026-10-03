import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/lib/core/app_storage.dart';

class UseDynamicProvider extends Notifier<bool> {
  @override
  bool build() => AppStorage.getWillUseSeedColor();

  void toggleWillUseDynamicColor() {
    final val = state;
    AppStorage.setWillUseSeedColor(!val);
    state = !val;
  }
}

final useDynamicProvider = NotifierProvider<UseDynamicProvider, bool>(
  UseDynamicProvider.new,
);
