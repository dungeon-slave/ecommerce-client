part of 'settings_bloc_bloc.dart';

class SettingsState {
  final bool isDark;
  final double textScale;

  const SettingsState({
    required this.isDark,
    required this.textScale,
  });

  SettingsState copyWith({
    bool? isDark,
    double? textScale,
  }) {
    return SettingsState(
      isDark: isDark ?? this.isDark,
      textScale: textScale ?? this.textScale,
    );
  }
}
