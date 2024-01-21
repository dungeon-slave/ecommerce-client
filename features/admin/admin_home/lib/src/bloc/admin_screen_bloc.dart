import 'package:core/core.dart' show Bloc, Emitter;

part 'admin_screen_event.dart';
part 'admin_screen_state.dart';

class AdminScreenBloc extends Bloc<AdminScreenEvent, AdminScreenState> {
  AdminScreenBloc() : super(AdminScreenState()) {
    on<InitEvent>(_init);
  }
}

void _init(InitEvent event, Emitter<AdminScreenState> emit) {

}
