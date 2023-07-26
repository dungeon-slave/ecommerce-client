import 'package:domain/domain.dart';
import 'package:domain/usecase/usecase.dart';

class GetCartCountUseCase implements UseCase<NoParams, int> {
  final CartRepository _cartRepository;

  const GetCartCountUseCase({
    required CartRepository cartRepository,
  }) : _cartRepository = cartRepository;

  @override
  int execute(NoParams input) {
    return _cartRepository.getItemsCount();
  }
}
