import 'package:domain/domain.dart';
import 'package:domain/usecase/usecase.dart';

class FetchCartCountUseCase implements UseCase<NoParams, int> {
  final CartRepository _cartRepository;

  const FetchCartCountUseCase({
    required CartRepository cartRepository,
  }) : _cartRepository = cartRepository;

  @override
  int execute(NoParams input) {
    return _cartRepository.fetchItemsCount();
  }
}
