library detailed_page;

import 'package:core/core.dart';

import 'detailed_page.gm.dart';

export 'detailed_page.gm.dart';
export 'src/ui/detailed_page_screen.dart';

@AutoRouterConfig.module(replaceInRouteName: 'Module|Screen,Route')
class DetailedPageModule extends $DetailedPageModule {}
