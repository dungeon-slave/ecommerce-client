library shopping_cart;

import 'package:core/core.dart';

import 'shopping_cart.gm.dart';

export 'shopping_cart.gm.dart';
export 'src/bloc/bloc.dart';
export 'src/ui/cart_item.dart';
export 'src/ui/shopping_cart_screen.dart';

@AutoRouterConfig.module()
class ShoppingCartModule extends $ShoppingCartModule {}
