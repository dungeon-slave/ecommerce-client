import 'package:core/core.dart';
import 'package:dishes_menu/src/bloc/dishes_menu_screen/dishes_menu_bloc.dart';
import 'package:domain/models/dishes_items/dish_model.dart';
import 'package:flutter/material.dart';
import 'package:core_ui/core_ui.dart';
import 'package:navigation/navigation.dart';

class DishItem extends StatefulWidget {
  final DishModel _model;

  void Function() _addToCartHandler(BuildContext context) {
    return () =>
        BlocProvider.of<MenuBloc>(context).add(AddDishEvent(model: _model));
  }

  const DishItem({
    required DishModel model,
    super.key,
  }) : _model = model;

  @override
  State<DishItem> createState() => _DishItemState();
}

class _DishItemState extends State<DishItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.navigateTo(
        DetailedPageRoute(
          model: widget._model,
          addToCartHandler: widget._addToCartHandler(context),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.only(
          top: AppDimens.margin5,
          bottom: AppDimens.margin5,
        ),
        padding: const EdgeInsets.only(
          top: AppDimens.padding10,
          bottom: AppDimens.padding10,
        ),
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              blurStyle: BlurStyle.outer,
              blurRadius: AppDimens.padding10,
              color: Theme.of(context).cardColor,
            ),
          ],
          borderRadius:
              const BorderRadius.all(Radius.circular(AppDimens.radius10)),
        ),
        child: Column(
          children: <Widget>[
            Text(
              widget._model.name,
              style: AppFonts.normal25
                  .copyWith(color: Theme.of(context).primaryColor),
            ),
            AppImage(
              imageRef: widget._model.imageRef,
              width: AppDimens.size200,
              height: AppDimens.size200,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  '${widget._model.price}\$',
                  style: AppFonts.bold24.copyWith(
                    color: Theme.of(context).indicatorColor,
                  ),
                ),
                AppButton(
                  text: AppConstants.addToCart,
                  handler: widget._addToCartHandler(context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
