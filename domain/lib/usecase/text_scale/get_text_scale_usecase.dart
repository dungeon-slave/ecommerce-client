import 'package:domain/domain.dart';
import 'package:domain/usecase/usecase.dart';

class GetTextScaleUseCase implements UseCase<NoParams, double> {
  final TextScaleRepository _textScaleRepository;

  const GetTextScaleUseCase({
    required TextScaleRepository textScaleRepository,
  }) : _textScaleRepository = textScaleRepository;

  @override
  double execute(NoParams input) => _textScaleRepository.getTextScale();
}
