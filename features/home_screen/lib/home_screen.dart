library home_screen;

import 'package:core/core.dart';

export 'src/ui/home_screen.dart';

import 'home_screen.gm.dart';
export 'home_screen.gm.dart';

@AutoRouterConfig.module(replaceInRouteName: 'Screen,Route')
class HomeScreenModule extends $HomeScreenModule {}
