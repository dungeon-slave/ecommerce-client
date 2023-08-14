library sign_in_screen;

import 'package:core/core.dart';

export 'src/ui/sign_in_screen.dart';
export 'src/bloc/sign_in_bloc.dart';

import 'sign_in_screen.gm.dart';
export 'sign_in_screen.gm.dart';

@AutoRouterConfig.module(replaceInRouteName: 'Screen,Route')
class SignInModule extends $SignInModule {}
