part of 'bloc.dart';

abstract class IMenuEvent {}

class InitEvent extends IMenuEvent {}

class ChangeTypeEvent extends IMenuEvent {
  final String type;

  ChangeTypeEvent(this.type);
}
