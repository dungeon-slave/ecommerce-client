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
    return Stack(
      children: <Widget>[
        Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: AppBar(
            iconTheme: Theme.of(context).iconTheme,
            leading: IconButton(
              icon: AppIcons.closeDetailedPage,
              onPressed: () => Navigator.of(context).pop(),
            ),
            centerTitle: true,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            title: Text(
              _model.name,
              style: AppFonts.normal25.copyWith(
                color: Theme.of(context).primaryColor,
                fontSize: AppDimens.size30,
              ),
            ),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: AppDimens.padding100),
            child: Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.all(AppDimens.padding50),
                  decoration: BoxDecoration(
                    borderRadius:
                        const BorderRadius.all(Radius.circular(AppDimens.padding10)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Theme.of(context).shadowColor,
                        blurRadius: AppDimens.padding100,
                      ),
                    ],
                  ),
                  child: AppImage(
                    imageRef: _model.imageRef,
                    width: AppDimens.size250,
                    height: AppDimens.size250,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: AppDimens.padding25),
                  child: Text(
                    AppConstants.detailedDescription,
                    style: AppFonts.normal25.copyWith(
                      fontSize: AppDimens.size30,
                      color: Theme.of(context).indicatorColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: AppDimens.padding15,
                    right: AppDimens.padding15,
                  ),
                  child: Text(
                    textAlign: TextAlign.center,
                    _model.description,
                    style: AppFonts.normal22.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: AppDimens.padding25,
                    top: AppDimens.padding25,
                  ),
                  child: Text(
                    AppConstants.detailedIngredients,
                    style: AppFonts.normal25.copyWith(
                      fontSize: AppDimens.size30,
                      color: Theme.of(context).indicatorColor,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: List.generate(
                    _model.ingredients.length,
                    (int index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          left: AppDimens.padding25,
                          right: AppDimens.padding10,
                          bottom: AppDimens.padding20,
                        ),
                        child: Text(
                          '- ${_model.ingredients[index]}',
                          style: AppFonts.normal22.copyWith(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: const EdgeInsets.all(AppDimens.padding10),
            padding: const EdgeInsets.only(
              top: AppDimens.padding10,
              bottom: AppDimens.padding10,
            ),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurStyle: BlurStyle.inner,
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
                BoxShadow(
                  blurStyle: BlurStyle.outer,
                  blurRadius: AppDimens.padding10,
                  color: Theme.of(context).indicatorColor,
                ),
              ],
              borderRadius:
                  const BorderRadius.all(Radius.circular(AppDimens.padding10)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  _model.price,
                  style: AppFonts.normal24.copyWith(
                    color: Theme.of(context).indicatorColor,
                  ),
                ),
                ElevatedButton(
                  onPressed: () => {},
                  child: Text(
                    AppConstants.addToCart,
                    style: AppFonts.normal22.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
