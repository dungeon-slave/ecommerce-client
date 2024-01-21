library settings;

import 'package:core/core.dart';
import 'settings.gm.dart';

export 'src/ui/settings_screen.dart';
export 'src/bloc/bloc.dart';
export 'settings.gm.dart';

@AutoRouterConfig.module()
class SettingsModule extends $SettingsModule {}
