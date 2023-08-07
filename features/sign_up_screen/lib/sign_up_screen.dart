library sign_up_screen;

import 'package:core/core.dart';

export 'src/ui/sign_up_screen.dart';
export 'src/bloc/sign_up_bloc.dart';

import 'sign_up_screen.gm.dart';
export 'sign_up_screen.gm.dart';

@AutoRouterConfig.module(replaceInRouteName: 'Screen,Route')
class SignUpModule extends $SignUpModule {}
