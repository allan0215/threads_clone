class SettingsModel {
  final bool isDarkMode;

  SettingsModel({this.isDarkMode = false});

  // 새로운 상태를 반환하는 메서드를 추가합니다.
  SettingsModel copyWith({bool? isDarkMode}) {
    return SettingsModel(
      isDarkMode: isDarkMode ?? this.isDarkMode,
    );
  }
}
