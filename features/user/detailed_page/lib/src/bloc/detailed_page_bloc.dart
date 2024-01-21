import 'package:core/core.dart';

part 'detailed_page_event.dart';
part 'detailed_page_state.dart';

class DetailedPageBloc extends Bloc<DetailedPageEvent, DetailedPageState> {
  final StackRouter _appRouter;

  DetailedPageBloc({required StackRouter appRouter})
      : _appRouter = appRouter,
        super(const DetailedPageState()) {
    on<CloseDetailedEvent>(_close);
  }

  void _close(_, __) => _appRouter.pop();
}
