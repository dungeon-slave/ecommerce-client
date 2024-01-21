import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/models/cart_items/cart_item_model.dart';
import 'package:flutter/material.dart';
import 'package:shopping_cart/src/bloc/shopping_cart/shopping_cart_bloc.dart';

class CartItem extends StatelessWidget {
  final CartItemModel _model;

  const CartItem({
    required CartItemModel model,
    super.key,
  }) : _model = model;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final ShoppingCartBloc shoppingCartBloc =
        BlocProvider.of<ShoppingCartBloc>(context);

    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: themeData.indicatorColor),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Hero(
            tag: _model.dishModel.id,
            child: AppImage(
              imageRef: _model.dishModel.imageRef,
              width: AppDimens.size100,
              height: AppDimens.size100,
            ),
          ),
          Column(
            children: <Widget>[
              Text(
                _model.dishModel.name,
                style: AppFonts.normal22,
              ),
              Row(
                children: <Widget>[
                  IconButton(
                    onPressed: () => shoppingCartBloc.add(
                      DecrementEvent(model: _model),
                    ),
                    icon: const Icon(Icons.remove_circle),
                    color: themeData.indicatorColor,
                  ),
                  Text(
                    _model.count.toString(),
                    style: AppFonts.normal22,
                  ),
                  IconButton(
                    onPressed: () => shoppingCartBloc.add(
                      IncrementEvent(model: _model),
                    ),
                    icon: const Icon(Icons.add_circle),
                    color: themeData.indicatorColor,
                  ),
                ],
              )
            ],
          ),
          Text(
            '${_model.averagePrice.toStringAsFixed(AppNumConstants.priceSize)}\$',
            style: AppFonts.normal22,
          ),
        ],
      ),
    );
  }
}
