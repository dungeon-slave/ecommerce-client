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
        top: AppDimens.margin5,
        bottom: AppDimens.margin5,
      ),
      padding: const EdgeInsets.only(
        top: AppDimens.padding10,
        bottom: AppDimens.padding10,
      ),
      decoration: const BoxDecoration(
        color: AppColors.smoothBrown,
        borderRadius: BorderRadius.all(Radius.circular(AppDimens.radius10)),
      ),
      child: Column(
        children: <Widget>[
          Text(
            widget._name,
            style: AppFonts.normal25.copyWith(color: AppColors.lightWhite),
          ),
          AppImage(
            imageRef: widget._imageRef,
            width: AppDimens.size200,
            height: AppDimens.size200,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                widget._price,
                style: AppFonts.normal24.copyWith(
                  color: AppColors.smoothYellow,
                ),
              ),
              ElevatedButton(
                onPressed: () => {},
                child: Text(
                  AppConstants.addToCart,
                  style: AppFonts.normal22.copyWith(
                    color: AppColors.lightWhite,
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
