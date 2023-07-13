import 'package:core_ui/core_ui.dart';
import 'package:domain/models/dish_model.dart';
import 'package:flutter/material.dart';

class DetailedPageScreen extends StatelessWidget {
  final DishModel _model;

  const DetailedPageScreen({
    super.key,
    required DishModel model,
  }) : _model = model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimens.padding50/2),
        color: AppColors.dartBreeze,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            _model.name,
            style: AppFonts.normal25.copyWith(color: AppColors.lightWhite),
          ),
          AppImage(
            imageRef: _model.imageRef,
            height: AppDimens.size200 * 1.5,
            width: AppDimens.size200 * 1.5,
          ),
          Text(
            _model.price,
            style: AppFonts.normal24.copyWith(
              color: AppColors.smoothYellow,
            ),
          ),
          Text(
            _model.description,
            style: AppFonts.normal22.copyWith(color: AppColors.lightWhite),
          ),
          Wrap(
            children: List.generate(
              _model.ingredients.length,
              (index) => Container(
                margin: const EdgeInsets.all(AppDimens.padding10),
                width: MediaQuery.of(context).size.width / 3,
                child: Text(
                  '- ${_model.ingredients[index]}',
                  style: AppFonts.normal22.copyWith(color: AppColors.lightWhite),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
