library shopping_cart;

import 'package:core/core.dart';

export 'src/ui/shopping_cart.dart';
export 'src/bloc/bloc.dart';

import 'shopping_cart.gm.dart';
export 'shopping_cart.gm.dart';

@AutoRouterConfig.module(replaceInRouteName: 'Screen,Route')
class ShoppingCartModule extends $ShoppingCartModule {}
