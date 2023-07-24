import 'package:domain/models/dishes_items/dish_type_model.dart';
import 'package:domain/repositories/dishes_repository.dart';
import 'package:domain/usecase/usecase.dart';

class SaveDishesUseCase implements AsyncUseCase<List<DishTypeModel>, void> {
  final DishesRepository _dishesRepository;

  const SaveDishesUseCase({
    required DishesRepository dishesRepository,
  }) : _dishesRepository = dishesRepository;

  @override
  Future<void> execute(List<DishTypeModel> input) async =>
      _dishesRepository.saveMenu(input);
}
