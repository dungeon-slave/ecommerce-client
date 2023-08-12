import 'package:core_ui/core_ui.dart';
import 'package:domain/models/order_history/order_model.dart';
import 'package:flutter/material.dart';

class MainInfo extends StatelessWidget {
  final OrderModel _model;

  const MainInfo({
    required OrderModel model,
    super.key,
  }) : _model = model;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Container>[
        Container(
          alignment: Alignment.center,
          child: Text(
            '${AppConstants.orderN}${_model.id}',
            style: AppFonts.normal22,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            top: AppDimens.margin5,
            bottom: AppDimens.margin5,
          ),
          child: Divider(
            thickness: AppConstants.orderDividerThickness,
            endIndent: AppDimens.padding15,
            color: Theme.of(context).indicatorColor,
          ),
        ),
        Container(
          padding: const EdgeInsets.only(bottom: AppDimens.padding10),
          alignment: Alignment.centerLeft,
          child: Text(
            '${AppConstants.date}: ${_model.dateTime.day}.${_model.dateTime.month}.${_model.dateTime.year}',
            style: AppFonts.normal22,
          ),
        ),
        Container(
          padding: const EdgeInsets.only(bottom: AppDimens.padding10),
          alignment: Alignment.centerLeft,
          child: Text(
            '${AppConstants.time}: ${_model.dateTime.hour}:${_model.dateTime.minute}',
            style: AppFonts.normal22,
          ),
        ),
        Container(
          padding: const EdgeInsets.only(bottom: AppDimens.margin5),
          alignment: Alignment.centerLeft,
          child: Text(
            '${AppConstants.total}: ${_model.price.toStringAsFixed(AppConstants.priceSize)}\$',
            style: AppFonts.normal22,
          ),
        ),
      ],
    );
  }
}
