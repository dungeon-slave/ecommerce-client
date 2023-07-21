import 'package:core/core.dart';
import 'package:dishes_menu/dishes_menu.dart';
import 'package:flutter/widgets.dart';
import 'package:home_screen/src/bloc/home_screen_bloc.dart';
import 'package:shopping_cart/shopping_cart.dart';

class CartObserver extends BlocObserver {
  final BuildContext _context;

  const CartObserver({required BuildContext context}) : _context = context;

  @override
  void onTransition(Bloc bloc, Transition transition) {
    if (transition.event is AddDishEvent || transition.event is ShoppingCartEvent) {
      BlocProvider.of<HomeScreenBloc>(_context).add(ChangeCartCountEvent());
    }
    super.onTransition(bloc, transition);
  }
}
