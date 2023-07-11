part of 'dishes_menu_bloc.dart';

abstract class MenuEvent {}

class InitEvent extends MenuEvent {}

class ChangeTypeEvent extends MenuEvent {
  final String type;

  ChangeTypeEvent(this.type);
}

class GetDishesTypesEvent extends MenuEvent {}

class GetDishesTypeEvent extends MenuEvent {
  final int selectedIndex;

  GetDishesTypeEvent(this.selectedIndex);
}
