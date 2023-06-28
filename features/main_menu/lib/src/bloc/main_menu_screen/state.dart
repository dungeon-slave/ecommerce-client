part of 'bloc.dart';

abstract class IMenuState {}

class EmptyState extends IMenuState {}

class LoadingState extends IMenuState {}

class MenuState extends IMenuState {
  final List<DishModel> dishes;

  MenuState({required this.dishes});
}

class ErrorState extends IMenuState {
  final String errorMessage;

  ErrorState({required this.errorMessage});
}
