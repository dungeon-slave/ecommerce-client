import 'package:domain/domain.dart';
import 'package:domain/models/dish_model.dart';
import 'package:domain/usecase/usecase.dart';

class FetchDishesUsecase implements IUseCase<String, List<DishModel>> {
  final IDishesRepository _dishesRepository;

  const FetchDishesUsecase(this._dishesRepository);

  @override
  Future<List<DishModel>> execute(String input) async {
    return _dishesRepository.searchDishesByType(input);
  }
}
