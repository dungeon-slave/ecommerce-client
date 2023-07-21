import 'package:domain/domain.dart';
import 'package:domain/usecase/usecase.dart';

class GetCartCountUseCase extends UseCase<NoParams, int> {
  final CartRepository _cartRepository;

  GetCartCountUseCase({required CartRepository cartRepository}) : _cartRepository = cartRepository;

  @override
  int execute(NoParams input) {
    return _cartRepository.getItemsCount();
  }
}
