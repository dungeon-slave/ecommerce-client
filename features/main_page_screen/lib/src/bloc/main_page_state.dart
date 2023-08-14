part of 'main_page_bloc.dart';

class MainPageState {
  final bool isChecked;
  final bool isDark;
  final double textScale;

  const MainPageState({
    required this.isChecked,
    required this.isDark,
    required this.textScale,
  });

  MainPageState copyWith({
    bool? isChecked,
    bool? isDark,
    double? textScale,
  }) {
    return MainPageState(
      isChecked: isChecked ?? this.isChecked,
      isDark: isDark ?? this.isDark,
      textScale: textScale ?? this.textScale,
    );
  }
}
