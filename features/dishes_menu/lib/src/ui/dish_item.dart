import 'package:domain/models/dish_model.dart';
import 'package:flutter/material.dart';
import 'package:core_ui/core_ui.dart';
import 'package:navigation/navigation.dart';

class DishItem extends StatefulWidget {
  final DishModel _model;

  const DishItem({
    required DishModel model,
    super.key,
  }) : _model = model;

  @override
  State<StatefulWidget> createState() => DishItemState();
}

class DishItemState extends State<DishItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.navigateTo(
        DetailedPageRoute(model: widget._model),
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
          color: Theme.of(context).cardColor,
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
                  widget._model.price,
                  style: AppFonts.normal24.copyWith(
                    color: Theme.of(context).indicatorColor,
                  ),
                ),
                ElevatedButton(
                  onPressed: () => {},
                  child: Text(
                    AppConstants.addToCart,
                    style: AppFonts.normal22.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
