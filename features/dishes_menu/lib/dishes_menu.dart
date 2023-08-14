library dishes_menu;

import 'package:core/core.dart';

export 'src/ui/dishes_menu.dart';
export 'src/bloc/bloc.dart';

import 'dishes_menu.gm.dart';
export 'dishes_menu.gm.dart';

@AutoRouterConfig.module(replaceInRouteName: 'Screen,Route')
class DishesMenuModule extends $DishesMenuModule {}
