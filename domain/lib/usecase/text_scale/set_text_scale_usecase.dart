import 'package:domain/domain.dart';
import 'package:domain/usecase/usecase.dart';

class SetTextScaleUseCase implements AsyncUseCase<double, void> {
  final TextScaleRepository _textScaleRepository;

  const SetTextScaleUseCase({
    required TextScaleRepository textScaleRepository,
  }) : _textScaleRepository = textScaleRepository;

  @override
  Future<void> execute(double input) async =>
      await _textScaleRepository.saveTextScale(input);
}
