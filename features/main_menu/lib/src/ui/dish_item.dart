import 'package:flutter/material.dart';
import 'package:core_ui/core_ui.dart';

class DishItem extends StatefulWidget {
  final String _name;
  final String _imageRef;
  final String _price;

  const DishItem(this._name, this._imageRef, this._price, {super.key});

  @override
  State<StatefulWidget> createState() => DishItemState();
}

class DishItemState extends State<DishItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
          top: Dimens.vertCardMargin, bottom: Dimens.vertCardMargin),
      padding: const EdgeInsets.only(
          top: Dimens.vertCardPadding, bottom: Dimens.vertCardPadding),
      decoration: const BoxDecoration(
        color: MyColors.dartBreeze,
        borderRadius: BorderRadius.all(Radius.circular(Dimens.cardRadius)),
      ),
      child: Column(
        children: [
          Text(
            widget._name,
            style: Fonts.dishNameFont,
          ),
          Image.network(
            widget._imageRef,
            width: Dimens.imageSize,
            height: Dimens.imageSize,
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return Center(
                child: Container(
                  padding: const EdgeInsets.all(Dimens.progressPadding),
                  width: Dimens.imageSize,
                  height: Dimens.imageSize,
                  child: CircularProgressIndicator(
                    strokeWidth: Dimens.progressCircleWidth,
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                ),
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                widget._price,
                style: Fonts.priceFont,
              ),
              ElevatedButton(
                onPressed: () => {},
                child: const Text(
                  'Add to cart',
                  style: Fonts.buttonFont,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
