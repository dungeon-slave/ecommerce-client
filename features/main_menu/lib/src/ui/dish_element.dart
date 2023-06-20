import 'package:flutter/material.dart';

class DishElement extends StatefulWidget {

  late final String _name;

  DishElement({super.key, required String name}) {
    _name = name;
  }

  @override
  State<StatefulWidget> createState() => DishElementState(_name);
}

class DishElementState extends State<StatefulWidget> {

  late final String _name;

  DishElementState(String name) {
    _name = name;
  }

  @override
  Widget build(BuildContext context) {

    double vertPadding = MediaQuery.sizeOf(context).width / 2 - 35;

    return Container(
      margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      padding: EdgeInsets.fromLTRB(vertPadding, 50, vertPadding, 50),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 34, 34, 34)
      ),
      child: Text(
              _name,
              style: const TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 18
                          ),
            )
    );
  }
}
