import 'package:core/core.dart' show Bloc, Emitter;
import 'package:domain/domain.dart';
import 'package:domain/models/cart_items/cart_item_model.dart';
import 'package:domain/models/order_history/order_model.dart';
import 'package:domain/usecase/shopping_cart/send_order_usecase.dart';
import 'package:domain/usecase/usecase.dart';

part 'shopping_cart_event.dart';
part 'shopping_cart_state.dart';

class ShoppingCartBloc extends Bloc<ShoppingCartEvent, ShoppingCartState> {
  final ChangeItemCountUseCase _changeItemCountUseCase;
  final FetchItemsUseCase _fetchItemsUseCase;
  final SendOrderUseCase _sendOrderUseCase;
  final ClearCartUseCase _clearCartUseCase;

  ShoppingCartBloc({
    required ChangeItemCountUseCase changeItemCountUseCase,
    required FetchItemsUseCase fetchItemsUseCase,
    required ClearCartUseCase clearCartUseCase,
    required SendOrderUseCase sendOrderUseCase,
  })  : _changeItemCountUseCase = changeItemCountUseCase,
        _fetchItemsUseCase = fetchItemsUseCase,
        _clearCartUseCase = clearCartUseCase,
        _sendOrderUseCase = sendOrderUseCase,
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
      emit(
        state.copyWith(
          isLoading: false,
          items: _fetchItemsUseCase.execute(const NoParams()),
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
    DecrementEvent event,
    Emitter<ShoppingCartState> emit,
  ) async {
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
    emit(
      state.copyWith(
        items: state.items,
      ),
    );
  }

  Future<void> _incrementItem(
    IncrementEvent event,
    Emitter<ShoppingCartState> emit,
  ) async {
    int index = state.items.indexWhere((CartItemModel element) =>
        element.dishModel.id == event.model.dishModel.id);
    CartItemModel currElement =
        state.items[index].copyWith(count: state.items[index].count + 1);
    await _changeItemCountUseCase.execute(currElement);
    state.items[index] = currElement;
    emit(
      state.copyWith(
        items: state.items,
      ),
    );
  }

  Future<void> _clearCart(
    ClearCartEvent event,
    Emitter<ShoppingCartState> emit,
  ) async {
    await _clearCartUseCase.execute(const NoParams());
    emit(
      state.copyWith(
        isLoading: false,
        items: _fetchItemsUseCase.execute(const NoParams()),
      ),
    );
  }

  Future<void> _checkout(
    CheckoutEvent event,
    Emitter<ShoppingCartState> emit,
  ) async {
    try {
      await _sendOrderUseCase.execute(
        OrderModel(
          id: DateTime.now().microsecondsSinceEpoch.toString(),
          dateTime: DateTime.now(),
          price: state.totalPrice(),
          products: state.items,
        ),
      );
      await _clearCartUseCase.execute(const NoParams());
      emit(
        state.copyWith(
          isLoading: false,
          items: _fetchItemsUseCase.execute(const NoParams()),
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
}
