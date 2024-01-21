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
      children: <Widget>[
        Align(
          alignment: Alignment.center,
          child: Text(
            '${AppStrConstants.orderN}${_model.id}',
            style: AppFonts.normal22,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: AppDimens.margin5,
            bottom: AppDimens.margin5,
          ),
          child: Divider(
            thickness: AppNumConstants.orderDividerThickness,
            endIndent: AppDimens.padding15,
            color: Theme.of(context).indicatorColor,
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(bottom: AppDimens.padding10),
            child: Text(
              '${AppStrConstants.date}: ${_model.dateTime.day}.${_model.dateTime.month}.${_model.dateTime.year}',
              style: AppFonts.normal22,
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(bottom: AppDimens.padding10),
            child: Text(
              '${AppStrConstants.time}: ${_model.dateTime.hour}:${_model.dateTime.minute}',
              style: AppFonts.normal22,
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(bottom: AppDimens.margin5),
            child: Text(
              '${AppStrConstants.total}: ${_model.price.toStringAsFixed(AppNumConstants.priceSize)}\$',
              style: AppFonts.normal22,
            ),
          ),
        ),
      ],
    );
  }
}
