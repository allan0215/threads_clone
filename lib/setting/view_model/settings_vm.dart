import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thread_clone/setting/models/settings_model.dart';

class SettingsViewModel extends Notifier<SettingsModel> {
  @override
  build() {
    return SettingsModel();
  }

  void setDarkMode(bool value) {
    state = state.copyWith(isDarkMode: value);
  }

  bool get isDarkMode => state.isDarkMode;
}

final settingsProvider =
    NotifierProvider<SettingsViewModel, SettingsModel>(() => SettingsViewModel());
