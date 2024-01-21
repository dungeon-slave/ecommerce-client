import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:detailed_page/src/bloc/detailed_page_bloc.dart';
import 'package:domain/models/dishes_items/dish_model.dart';
import 'package:flutter/material.dart';

class DetailedPageContent extends StatelessWidget {
  final AnimationController _controller;
  final Animation<double> _animation;
  final DishModel _model;
  final void Function() _addToCartHandler;

  const DetailedPageContent({
    required AnimationController controller,
    required Animation<double> animation,
    required DishModel model,
    required void Function() addToCartHandler,
    super.key,
  })  : _animation = animation,
        _controller = controller,
        _model = model,
        _addToCartHandler = addToCartHandler;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final DetailedPageBloc detailedPageBloc =
        BlocProvider.of<DetailedPageBloc>(context);

    return LayoutBuilder(
      builder: (_, BoxConstraints constraints) {
        return SafeArea(
          minimum: EdgeInsets.only(top: constraints.minHeight / 28),
          child: Scaffold(
            backgroundColor: themeData.scaffoldBackgroundColor,
            appBar: AppBar(
              leading: const SizedBox.shrink(),
              backgroundColor: themeData.scaffoldBackgroundColor,
              centerTitle: true,
              actions: <Container>[
                Container(
                  margin: const EdgeInsets.only(right: AppDimens.padding10),
                  child: BlocBuilder<DetailedPageBloc, DetailedPageState>(
                    builder: (BuildContext context, DetailedPageState state) {
                      return IconButton(
                        iconSize: AppNumConstants.deleteIconSize,
                        icon: const AppIcon(
                          AppIconsData.closeDetailedPage,
                          size: AppDimens.size40,
                        ),
                        color: themeData.primaryColor,
                        onPressed: () => detailedPageBloc.add(
                          CloseDetailedEvent(),
                        ),
                      );
                    },
                  ),
                ),
              ],
              title: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  _model.name,
                  style: AppFonts.normal30.copyWith(
                    color: themeData.primaryColor,
                  ),
                ),
              ),
            ),
            body: ListView(
              padding: const EdgeInsets.only(
                bottom: AppDimens.padding100,
              ),
              children: <Container>[
                Container(
                  margin: const EdgeInsets.all(AppDimens.padding50),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(AppDimens.padding10),
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: themeData.shadowColor,
                        blurRadius: AppDimens.padding100,
                      ),
                    ],
                  ),
                  child: Hero(
                    tag: _model.id,
                    child: AppImage(
                      imageRef: _model.imageRef,
                      width: AppDimens.size250,
                      height: AppDimens.size250,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(left: AppDimens.padding50),
                  padding: const EdgeInsets.only(bottom: AppDimens.padding25),
                  child: Text(
                    AppStrConstants.detailedDescription,
                    style: AppFonts.normal30.copyWith(
                      color: themeData.indicatorColor,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(
                    left: AppDimens.padding50,
                    right: AppDimens.padding15,
                  ),
                  child: Text(
                    _model.description,
                    style: AppFonts.normal22,
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(left: AppDimens.padding50),
                  padding: const EdgeInsets.only(
                    bottom: AppDimens.padding25,
                    top: AppDimens.padding25,
                  ),
                  child: Text(
                    AppStrConstants.detailedIngredients,
                    style: AppFonts.normal30.copyWith(
                      color: themeData.indicatorColor,
                    ),
                  ),
                ),
                ...List.generate(
                  _model.ingredients.length,
                  (int index) {
                    return Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(left: AppDimens.padding50),
                      padding: const EdgeInsets.only(
                        right: AppDimens.padding20,
                        bottom: AppDimens.padding20,
                      ),
                      child: Text(
                        '- ${_model.ingredients[index]}',
                        style: AppFonts.normal22,
                      ),
                    );
                  },
                ),
              ],
            ),
            bottomSheet: Container(
              padding: const EdgeInsets.only(
                top: AppDimens.padding10,
                bottom: AppDimens.padding10,
              ),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: themeData.indicatorColor),
                ),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    blurStyle: BlurStyle.normal,
                    color: themeData.scaffoldBackgroundColor,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    '${_model.price}\$',
                    style: AppFonts.bold24.copyWith(
                      color: themeData.indicatorColor,
                    ),
                  ),
                  AnimatedBuilder(
                    animation: _animation,
                    child: Padding(
                      padding: EdgeInsets.all(_animation.value),
                      child: AppButton(
                        text: AppStrConstants.addToCart,
                        handler: () {
                          if (_controller.isAnimating) {
                            _controller.reset();
                          }
                          _controller.forward();
                          _addToCartHandler();
                        },
                      ),
                    ),
                    builder: (_, Widget? child) {
                      return Transform.scale(
                        scale: _animation.value,
                        child: child,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
