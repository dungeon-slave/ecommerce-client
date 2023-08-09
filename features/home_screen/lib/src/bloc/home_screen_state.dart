part of 'home_screen_bloc.dart';

class HomeScreenState {
  final int count;
  final bool isConnected;
  final bool isVisibleMessage;

  const HomeScreenState({
    required this.count,
    required this.isConnected,
    required this.isVisibleMessage,
  });

  HomeScreenState copyWith({
    int? count,
    bool? isConnected,
    bool? isVisibleMessage,
    bool? isDark,
    double? textScale,
  }) {
    return HomeScreenState(
      count: count ?? this.count,
      isConnected: isConnected ?? this.isConnected,
      isVisibleMessage: isVisibleMessage ?? this.isVisibleMessage,
    );
  }
}
