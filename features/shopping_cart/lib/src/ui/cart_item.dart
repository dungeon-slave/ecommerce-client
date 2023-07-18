import 'package:core_ui/core_ui.dart';
import 'package:domain/models/dish_model.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final DishModel _model;
  final int _amount;

  const CartItem({
    required DishModel model,
    super.key,
  })  : _model = model;

  double getAveragePrice() => _model.price * _amount;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Theme.of(context).indicatorColor),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          const AppImage(
            imageRef: "",
            width: 100,
            height: 100,
          ),
          Column(
            children: <Widget>[
              Text(
                _model.name,
                style: AppFonts.normal22,
              ),
              Row(
                children: <Widget>[
                  IconButton(
                    onPressed: () => {},
                    icon: const Icon(Icons.remove_circle),
                    color: Theme.of(context).indicatorColor,
                  ),
                  const Text(
                    '1',
                    style: AppFonts.normal22,
                  ),
                  IconButton(
                    onPressed: () => {},
                    icon: const Icon(Icons.add_circle),
                    color: Theme.of(context).indicatorColor,
                  ),
                ],
              )
            ],
          ),
          Text(
            '${_model.price}\$',
            style: AppFonts.normal22,
          ),
        ],
      ),
    );
  }
}
