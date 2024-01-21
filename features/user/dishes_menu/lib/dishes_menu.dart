library dishes_menu;

import 'package:core/core.dart';

import 'dishes_menu.gm.dart';

export 'dishes_menu.gm.dart';
export 'src/bloc/bloc.dart';
export 'src/ui/dish_item.dart';
export 'src/ui/dishes_menu_screen.dart';

@AutoRouterConfig.module()
class DishesMenuModule extends $DishesMenuModule {}
