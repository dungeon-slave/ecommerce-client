part of 'dishes_menu_bloc.dart';

abstract class MenuEvent {}

class InitEvent extends MenuEvent {}

class ChangeTypeEvent extends MenuEvent {
  final int typeIndex;

  ChangeTypeEvent(this.typeIndex);
}

class AddDishEvent extends MenuEvent {
  final DishModel model;

  AddDishEvent({required this.model});
}
