part of 'home_screen_bloc.dart';

abstract class HomeScreenEvent {}

class ChangeCartCountEvent extends HomeScreenEvent {}

class ChangeConnectionEvent extends HomeScreenEvent {
  final bool isConnected;

  ChangeConnectionEvent({required this.isConnected});
}
