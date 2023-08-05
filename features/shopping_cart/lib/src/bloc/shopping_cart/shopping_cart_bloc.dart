import 'package:core/core.dart' show Bloc, Emitter;
import 'package:domain/domain.dart';
import 'package:domain/models/cart_items/cart_item_model.dart';
import 'package:domain/usecase/usecase.dart';

part 'shopping_cart_event.dart';
part 'shopping_cart_state.dart';

class ShoppingCartBloc extends Bloc<ShoppingCartEvent, ShoppingCartState> {
  final ChangeItemCountUseCase _changeItemCountUseCase;
  final GetItemsUseCase _getItemsUseCase;
  final ClearCartUseCase _clearCartUseCase;

  ShoppingCartBloc({
    required ChangeItemCountUseCase changeItemCountUseCase,
    required GetItemsUseCase getItemsUseCase,
    required ClearCartUseCase clearCartUseCase,
  })  : _changeItemCountUseCase = changeItemCountUseCase,
        _getItemsUseCase = getItemsUseCase,
        _clearCartUseCase = clearCartUseCase,
        super(
          const ShoppingCartState(
            items: <CartItemModel>[],
            isLoading: true,
          ),
        ) {
    on<InitEvent>(_init);
    on<ClearCartEvent>(_clearCart);
    on<CheckoutEvent>(_checkout);
    on<IncrementEvent>(_incrementItem);
    on<DecrementEvent>(_decrementItem);

    add(InitEvent());
  }

  void _init(InitEvent event, Emitter<ShoppingCartState> emit) {
    try {
      final List<CartItemModel> items =
          _getItemsUseCase.execute(const NoParams());
      emit(
        state.copyWith(
          isLoading: false,
          items: items,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> _decrementItem(
      DecrementEvent event, Emitter<ShoppingCartState> emit) async {
    int index = state.items.indexWhere((CartItemModel element) =>
        element.dishModel.id == event.model.dishModel.id);
    CartItemModel currElement =
        state.items[index].copyWith(count: state.items[index].count - 1);
    await _changeItemCountUseCase.execute(currElement);
    if (currElement.count != 0) {
      state.items[index] = currElement;
    } else {
      state.items.removeAt(index);
    }
    emit(state.copyWith(items: state.items));
  }

  Future<void> _incrementItem(
      IncrementEvent event, Emitter<ShoppingCartState> emit) async {
    int index = state.items.indexWhere((CartItemModel element) =>
        element.dishModel.id == event.model.dishModel.id);
    CartItemModel currElement =
        state.items[index].copyWith(count: state.items[index].count + 1);
    await _changeItemCountUseCase.execute(currElement);
    state.items[index] = currElement;
    emit(state.copyWith(items: state.items));
  }

  Future<void> _clearCart(
      ClearCartEvent event, Emitter<ShoppingCartState> emit) async {
    await _clearCartUseCase.execute(const NoParams());
    add(InitEvent()); //FIXME remove
  }

  void _checkout(CheckoutEvent event, Emitter<ShoppingCartState> emit) {
    //TODO implement checkout
  }
}
