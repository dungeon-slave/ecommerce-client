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
    final ThemeData themeData = Theme.of(context);

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
            color: themeData.cardColor,
          ),
        ],
        borderRadius: const BorderRadius.all(
          Radius.circular(AppDimens.radius10),
        ),
      ),
      child: Column(
        children: <Widget>[
          LayoutBuilder(
            builder: (_, BoxConstraints constraints) {
              return Column(
                children: <Widget>[
                  MainInfo(model: widget._model),
                  AppTextButton(
                    text: _isVisible
                        ? AppStrConstants.hideDetails
                        : AppStrConstants.showDetails,
                    handler: _changeVisibility,
                    textStyle: AppFonts.normal24.copyWith(
                      color: themeData.indicatorColor,
                    ),
                  ),
                  if (_isVisible)
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: widget._model.products.length,
                      itemBuilder: (_, int index) {
                        return Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: AppDimens.margin5,
                              bottom: AppDimens.margin5,
                              left: AppDimens.margin5,
                            ),
                            child: Text(
                              '${index + 1}. ${widget._model.products[index].dishModel.name} x ${widget._model.products[index].count}',
                              style: AppFonts.normal22,
                            ),
                          ),
                        );
                      },
                    ),
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
