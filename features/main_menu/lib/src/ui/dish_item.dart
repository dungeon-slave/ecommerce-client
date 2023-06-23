import 'package:flutter/material.dart';

class DishItem extends StatefulWidget {

  late final String _name;
  late final ImageProvider<Object> _image;
  late final String _price;
  late final String type;

  DishItem({
    super.key, 
    required String name, 
    required ImageProvider<Object> image, 
    required String type,
    required String price
  }) {

    _price = price;
    _name = name;
    _image = image;
    this.type = type;
  }

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
          Image(
            width: 200,
            height: 200,
            image: widget._image
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
