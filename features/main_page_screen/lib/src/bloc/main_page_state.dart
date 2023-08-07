part of 'main_page_bloc.dart';

class MainPageState {
  final bool isChecked;

  const MainPageState({
    required this.isChecked,
  });

  MainPageState copyWith({
    bool? isChecked,
  }) {
    return MainPageState(isChecked: isChecked ?? this.isChecked);
  }
}
