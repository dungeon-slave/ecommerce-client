import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:domain/models/cart_items/cart_item_model.dart';
import 'package:domain/usecase/usecase.dart';

part 'shopping_cart_event.dart';
part 'shopping_cart_state.dart';

class ShoppingCartBloc extends Bloc<ShoppingCartEvent, ShoppingCartState> {
  final ChangeItemCountUseCase _changeItemCountUseCase; //TODO implement
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
          ShoppingCartState(items: <CartItemModel>[]),
        ) {
    on<InitEvent>(_init);
    on<ClearCartEvent>(_clearCart);
    on<CheckoutEvent>(_checkout);
    on<IncrementEvent>(_incrementItem);
    on<DecrementEvent>(_decrementItem);

    add(InitEvent());
  }

  void _init(InitEvent event, Emitter<ShoppingCartState> emit) {
    emit(state.copyWith(isLoading: true));
    try {
      final List<CartItemModel> items =
          _getItemsUseCase.execute(const NoParams());
      emit(state.copyWith(
        isLoading: false,
        items: items,
      ));
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  void _decrementItem(DecrementEvent event, Emitter<ShoppingCartState> emit) {
    for (CartItemModel element in state.items) {
      if (element.dishModel.id == event.model.dishModel.id) {
        CartItemModel currElement = element.copyWith(count: element.count - 1);
        _changeItemCountUseCase.execute(currElement);
        state.items.remove(element);
        if (currElement.count != 0) {
          state.items.add(currElement);
        }
        break;
      } 
    }
    emit(state.copyWith(items: state.items));
  }

  void _incrementItem(IncrementEvent event, Emitter<ShoppingCartState> emit) {
    for (CartItemModel element in state.items) {
      if (element.dishModel.id == event.model.dishModel.id) {
        CartItemModel currElement = element.copyWith(count: element.count + 1);
        _changeItemCountUseCase.execute(currElement);
        state.items.remove(element);
        state.items.add(currElement);
        break;
      }
    }
    emit(state.copyWith(items: state.items));
  }

  void _clearCart(ClearCartEvent event, Emitter<ShoppingCartState> emit) async {
    await _clearCartUseCase.execute(const NoParams());
    add(InitEvent());
  }

  void _checkout(CheckoutEvent event, Emitter<ShoppingCartState> emit) {
    //TODO implement checkout
  }
}
