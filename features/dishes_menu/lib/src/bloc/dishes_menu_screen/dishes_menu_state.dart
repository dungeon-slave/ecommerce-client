part of 'dishes_menu_bloc.dart';

abstract class MenuState {}

class LoadingState extends MenuState {}

class ErrorState extends MenuState {
  final String errorMessage;

  ErrorState({required this.errorMessage});
}

class DishesListState extends MenuState {
  final List<DishModel> dishes;

  DishesListState({required this.dishes});
}

class TabsListState extends MenuState {
  final Iterable<String> tabsNames;

  TabsListState({required this.tabsNames});
}
