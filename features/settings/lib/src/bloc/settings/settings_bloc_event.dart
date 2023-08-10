part of 'settings_bloc_bloc.dart';

abstract class ThemeEvent {}

class SetThemeEvent extends ThemeEvent {
  final bool isDark;

  SetThemeEvent({required this.isDark});
}

class GetThemeEvent extends ThemeEvent {}

class SetTextScaleEvent extends ThemeEvent {
  final double textScale;

  SetTextScaleEvent({required this.textScale});
}

class GetTextScaleEvent extends ThemeEvent {}

class OpenLinkEvent extends ThemeEvent {
  final Uri link;

  OpenLinkEvent({required this.link});
}
