import 'package:domain/domain.dart';
import 'package:domain/models/dish_type_model.dart';
import 'package:domain/usecase/usecase.dart';

class FetchDishesUsecase implements UseCase<String, List<DishTypeModel>> {
  final DishesRepository _dishesRepository;

  const FetchDishesUsecase(this._dishesRepository);

  @override
  Future<List<DishTypeModel>> execute() async {
    return _dishesRepository.fetchDishes();
  }
}
