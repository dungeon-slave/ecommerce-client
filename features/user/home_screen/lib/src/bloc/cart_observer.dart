import 'package:core/core.dart'
    show Bloc, Transition, BlocObserver, BlocProvider;
import 'package:dishes_menu/dishes_menu.dart' show AddDishEvent;
import 'package:flutter/widgets.dart' show BuildContext;
import 'package:home_screen/src/bloc/home_screen_bloc.dart';
import 'package:shopping_cart/shopping_cart.dart' show ShoppingCartEvent;

class CartObserver extends BlocObserver {
  final BuildContext _context;

  const CartObserver({required BuildContext context}) : _context = context;

  @override
  void onTransition(Bloc bloc, Transition transition) {
    if (transition.event is AddDishEvent ||
        transition.event is ShoppingCartEvent) {
      //TODO remvoe context
      BlocProvider.of<HomeScreenBloc>(_context).add(ChangeCartCountEvent());
    }
    super.onTransition(bloc, transition);
  }
}
