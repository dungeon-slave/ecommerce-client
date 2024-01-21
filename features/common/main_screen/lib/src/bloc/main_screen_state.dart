part of 'main_screen_bloc.dart';

class MainScreenState {
  final bool isChecked;
  final bool isDark;
  final double textScale;

  const MainScreenState({
    required this.isChecked,
    required this.isDark,
    required this.textScale,
  });

  MainScreenState copyWith({
    bool? isChecked,
    bool? isDark,
    double? textScale,
  }) {
    return MainScreenState(
      isChecked: isChecked ?? this.isChecked,
      isDark: isDark ?? this.isDark,
      textScale: textScale ?? this.textScale,
    );
  }
}
