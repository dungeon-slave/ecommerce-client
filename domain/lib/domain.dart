library domain;

export 'package:domain/repositories/dishes_repository.dart';
export 'package:domain/repositories/theme_repository.dart';
export 'package:domain/repositories/cart_repository.dart';
export 'package:domain/repositories/text_scale_repository.dart';

export 'package:domain/usecase/dishes/fetch_dishes_usecase.dart';
export 'package:domain/usecase/dishes/save_dishes_usecase.dart';
export 'package:domain/usecase/theme/get_theme_usecase.dart';
export 'package:domain/usecase/theme/set_theme_usecase.dart';
export 'package:domain/usecase/shopping_cart/get_items_usecase.dart';
export 'package:domain/usecase/shopping_cart/save_item_usecase.dart';
export 'package:domain/usecase/shopping_cart/clear_cart_usecase.dart';
export 'package:domain/usecase/home_screen/get_cart_count_usecase.dart';
export 'package:domain/usecase/shopping_cart/change_item_count_usecase.dart';
export 'package:domain/usecase/text_scale/get_text_scale_usecase.dart';
export 'package:domain/usecase/text_scale/set_text_scale_usecase.dart';
