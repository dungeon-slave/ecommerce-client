import 'package:flutter/material.dart';
import 'package:core_ui/core_ui.dart';

class DishItem extends StatefulWidget {
  final String _name;
  final String _imageRef;
  final String _price;

  const DishItem(
      {required String name,
      required String imageRef,
      required String price,
      super.key})
      : _name = name,
        _imageRef = imageRef,
        _price = price;

  @override
  State<StatefulWidget> createState() => DishItemState();
}

class DishItemState extends State<DishItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: AppDimens.MARGIN_5,
        bottom: AppDimens.MARGIN_5,
      ),
      padding: const EdgeInsets.only(
        top: AppDimens.PADDING_10,
        bottom: AppDimens.PADDING_10,
      ),
      decoration: const BoxDecoration(
        color: AppColors.SMOOTH_BROWN,
        borderRadius: BorderRadius.all(Radius.circular(AppDimens.RADIUS_10)),
      ),
      child: Column(
        children: <Widget>[
          Text(
            widget._name,
            style: AppFonts.normal25.copyWith(color: AppColors.LIGHT_WHITE),
          ),
          AppImage(
            imageRef: widget._imageRef,
            width: AppDimens.SIZE_200,
            height: AppDimens.SIZE_200,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                widget._price,
                style: AppFonts.normal24.copyWith(
                  color: AppColors.SMOOTH_YELLOW,
                ),
              ),
              ElevatedButton(
                onPressed: () => {},
                child: Text(
                  AppConstants.ADD_TO_CART,
                  style: AppFonts.normal22.copyWith(
                    color: AppColors.LIGHT_WHITE,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
