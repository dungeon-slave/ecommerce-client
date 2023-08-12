import 'package:core_ui/core_ui.dart';
import 'package:domain/models/order_history/order_model.dart';
import 'package:flutter/material.dart';
import 'package:order_history/src/ui/components/main_info.dart';

class OrderHistoryItem extends StatefulWidget {
  final OrderModel _model;

  const OrderHistoryItem({
    required OrderModel model,
    super.key,
  }) : _model = model;

  @override
  State<OrderHistoryItem> createState() => _OrderHistoryItemState();
}

class _OrderHistoryItemState extends State<OrderHistoryItem>
    with AutomaticKeepAliveClientMixin {
  bool _isVisible = false;

  void _changeVisibility() {
    setState(() => _isVisible = !_isVisible);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      padding: const EdgeInsets.only(
        left: AppDimens.padding15,
        top: AppDimens.padding20,
        bottom: AppDimens.padding10,
      ),
      margin: const EdgeInsets.only(
        top: AppDimens.margin5,
        bottom: AppDimens.margin5,
      ),
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            blurStyle: BlurStyle.outer,
            blurRadius: AppDimens.padding10,
            color: Theme.of(context).cardColor,
          ),
        ],
        borderRadius: const BorderRadius.all(
          Radius.circular(AppDimens.radius10),
        ),
      ),
      child: Column(
        children: <Widget>[
          LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Column(
                children: <Widget>[
                  MainInfo(model: widget._model),
                  AppTextButton(
                    text: _isVisible
                        ? AppConstants.hideDetails
                        : AppConstants.showDetails,
                    handler: _changeVisibility,
                    textStyle: AppFonts.normal24.copyWith(
                      color: Theme.of(context).indicatorColor,
                    ),
                  ),
                  _isVisible
                      ? ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: widget._model.products.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.only(
                                top: AppDimens.margin5,
                                bottom: AppDimens.margin5,
                                left: AppDimens.margin5,
                              ),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                '${index + 1}. ${widget._model.products[index].dishModel.name} x ${widget._model.products[index].count}',
                                style: AppFonts.normal22,
                              ),
                            );
                          },
                        )
                      : const SizedBox.shrink(),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
