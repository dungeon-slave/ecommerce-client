part of 'settings_bloc_bloc.dart';

abstract class ThemeEvent {}

class SetThemeEvent extends ThemeEvent {
  final bool isDark;

  SetThemeEvent({required this.isDark});
}

class GetThemeEvent extends ThemeEvent {
  final String themeKey;

  GetThemeEvent({required this.themeKey});
}
