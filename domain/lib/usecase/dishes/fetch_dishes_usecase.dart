import 'package:domain/domain.dart';
import 'package:domain/models/dishes_items/dish_type_model.dart';
import 'package:domain/usecase/usecase.dart';

class FetchDishesUsecase implements AsyncUseCase<NoParams, List<DishTypeModel>> {
  final DishesRepository _dishesRepository;

  const FetchDishesUsecase(this._dishesRepository);

  @override
  Future<List<DishTypeModel>> execute(NoParams empty) async {
    return _dishesRepository.fetchDishes();
  }
}
