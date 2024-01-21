import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:detailed_page/src/bloc/detailed_page_bloc.dart';
import 'package:detailed_page/src/ui/detailed_page_content.dart';
import 'package:domain/models/dishes_items/dish_model.dart';
import 'package:flutter/material.dart';

@RoutePage()
class DetailedPageScreen extends StatefulWidget {
  final DishModel _model;
  final void Function() _addToCartHandler;

  const DetailedPageScreen({
    required DishModel model,
    required void Function() addToCartHandler,
    super.key,
  })  : _model = model,
        _addToCartHandler = addToCartHandler;

  @override
  State<DetailedPageScreen> createState() => _DetailedPageScreenState();
}

class _DetailedPageScreenState extends State<DetailedPageScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  Widget build(BuildContext context) {
    final StackRouter stackRouter = AutoRouter.of(context);

    return BlocProvider(
      create: (_) => DetailedPageBloc(
        appRouter: stackRouter,
      ),
      child: DetailedPageContent(
        controller: _controller,
        animation: _animation,
        model: widget._model,
        addToCartHandler: widget._addToCartHandler,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: AppNumConstants.scaleDuration),
    );
    _controller.addListener(
      () {
        if (_controller.isCompleted) {
          _controller.reverse();
        }
      },
    );
    _animation = Tween<double>(
      begin: AppNumConstants.buttonMinScale,
      end: AppNumConstants.buttonMaxScale,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
