import 'package:data/providers/local/hive_provider.dart';
import 'package:domain/repositories/text_scale_repository.dart';

class TextScaleRepositoryImpl implements TextScaleRepository {
  final HiveProvider _hiveProvider;

  const TextScaleRepositoryImpl({
    required HiveProvider hiveProvider,
  }) : _hiveProvider = hiveProvider;

  @override
  double fetchTextScale() => _hiveProvider.fetchTextScale();

  @override
  Future<void> saveTextScale(double textScale) async =>
      await _hiveProvider.saveTextScale(textScale);
}
