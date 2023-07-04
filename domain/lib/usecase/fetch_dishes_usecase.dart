import 'package:domain/domain.dart';
import 'package:domain/models/dish_model.dart';
import 'package:domain/usecase/usecase.dart';

class FetchDishesUsecase implements UseCase<String, List<DishModel>> {
  final DishesRepository _dishesRepository;

  const FetchDishesUsecase(this._dishesRepository);

  @override
  Future<List<DishModel>> execute() async {
    return _dishesRepository.fetchDishes();
  }
}
