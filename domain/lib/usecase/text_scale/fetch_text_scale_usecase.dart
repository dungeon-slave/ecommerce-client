import 'package:domain/domain.dart';
import 'package:domain/usecase/usecase.dart';

class FetchTextScaleUseCase implements UseCase<NoParams, double> {
  final TextScaleRepository _textScaleRepository;

  const FetchTextScaleUseCase({
    required TextScaleRepository textScaleRepository,
  }) : _textScaleRepository = textScaleRepository;

  @override
  double execute(NoParams input) => _textScaleRepository.fetchTextScale();
}
