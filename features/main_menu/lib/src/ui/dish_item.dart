import 'package:flutter/material.dart';

class DishItem extends StatefulWidget {

  final String _name;
  final String _imageRef;
  final String _price;

  const DishItem(
    this._name,
    this._imageRef, 
    this._price, 
    {super.key}
  );

  @override
  State<StatefulWidget> createState() => DishItemState();
}

class DishItemState extends State<DishItem> {

  static const double vertCardMargin = 5;
  static const double vertCardPadding = 10;

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.only(top: vertCardMargin, bottom: vertCardMargin),
      padding: const EdgeInsets.only(top: vertCardPadding, bottom: vertCardPadding),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 34, 34, 34),
        borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: Column(
        children: [
          Text(
            widget._name,
            style: const TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontSize: 25
            ),
          ),
          Image.network(
            widget._imageRef,
            width: 200,
            height: 200,
            loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return Center(
                child: Container(
                    padding: const EdgeInsets.all(50),
                    width: 200,
                    height: 200,
                    child:CircularProgressIndicator(
                      strokeWidth: 25.0,
                      value: loadingProgress.expectedTotalBytes != null ? 
                      loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
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
                style: const TextStyle(
                  color: Color.fromARGB(255, 248, 193, 52),
                  fontSize: 24
                ),
              ),
              ElevatedButton(
                onPressed: () => {}, 
                child: const Text(
                  'Add to cart',
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 22
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
