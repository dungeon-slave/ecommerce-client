import 'package:core_ui/core_ui.dart';
import 'package:domain/models/dishes_items/dish_model.dart';
import 'package:flutter/material.dart';

class DetailedPageScreen extends StatelessWidget {
  final DishModel _model;
  final void Function() _addToCartHandler;

  const DetailedPageScreen({
    required DishModel model,
    required void Function() addToCartHandler,
    super.key,
  })  : _model = model,
        _addToCartHandler = addToCartHandler;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        leading: IconButton(
          icon: AppIcons.closeDetailedPage,
          onPressed: () => Navigator.of(context).pop(), //TODO remove pop
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          _model.name,
          style: AppFonts.normal25.copyWith(
            color: Theme.of(context).primaryColor,
            fontSize: AppDimens.size30,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.only(
            bottom: AppDimens.padding100), //TODO try replace with margin
        children: <Container>[
          Container(
            margin: const EdgeInsets.all(AppDimens.padding50),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(AppDimens.padding10),
              ),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Theme.of(context).shadowColor,
                  blurRadius: AppDimens.padding100,
                ),
              ],
            ),
            child: AppImage(
              imageRef: _model.imageRef,
              width: AppDimens.size250,
              height: AppDimens.size250,
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(left: AppDimens.padding50),
            padding: const EdgeInsets.only(bottom: AppDimens.padding25),
            child: Text(
              AppConstants.detailedDescription,
              style: AppFonts.normal30.copyWith(
                color: Theme.of(context).indicatorColor,
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(
              left: AppDimens.padding50,
              right: AppDimens.padding15,
            ),
            child: Text(
              _model.description,
              style: AppFonts.normal22.copyWith(
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(left: AppDimens.padding50),
            padding: const EdgeInsets.only(
              bottom: AppDimens.padding25,
              top: AppDimens.padding25,
            ),
            child: Text(
              AppConstants.detailedIngredients,
              style: AppFonts.normal30.copyWith(
                color: Theme.of(context).indicatorColor,
              ),
            ),
          ),
          ...List.generate(
            _model.ingredients.length,
            (int index) {
              return Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: AppDimens.padding50),
                padding: const EdgeInsets.only(
                  right: AppDimens.padding20,
                  bottom: AppDimens.padding20,
                ),
                child: Text(
                  '- ${_model.ingredients[index]}',
                  style: AppFonts.normal22.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.only(
          top: AppDimens.padding10,
          bottom: AppDimens.padding10,
        ),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Theme.of(context).indicatorColor),
          ),
          boxShadow: <BoxShadow>[
            BoxShadow(
              blurStyle: BlurStyle.normal,
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              '${_model.price}\$',
              style: AppFonts.bold24.copyWith(
                color: Theme.of(context).indicatorColor,
              ),
            ),
            AppButton(
              text: AppConstants.addToCart,
              handler: _addToCartHandler,
            ),
          ],
        ),
      ),
    );
  }
}
