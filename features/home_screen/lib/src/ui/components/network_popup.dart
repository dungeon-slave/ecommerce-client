import 'package:core_ui/core_ui.dart'
    show AppDimens, AppColors, AppStrConstants, AppFonts;
import 'package:flutter/material.dart';

class NetworkPopUp extends StatelessWidget {
  final bool _isConnected;

  const NetworkPopUp({
    required bool isConnected,
    super.key,
  }) : _isConnected = isConnected;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: AppDimens.size380,
        margin: const EdgeInsets.only(
          bottom: AppDimens.padding65,
        ),
        decoration: BoxDecoration(
          color: _isConnected ? AppColors.green : AppColors.red,
          borderRadius: const BorderRadius.all(
            Radius.circular(AppDimens.radius10),
          ),
        ),
        padding: const EdgeInsets.only(
          top: AppDimens.padding10,
          bottom: AppDimens.padding10,
        ),
        child: Text(
          textAlign: TextAlign.center,
          _isConnected
              ? AppStrConstants.connectionRestored
              : AppStrConstants.connectionLoss,
          style: AppFonts.normal24.copyWith(
            color: AppColors.absWhite,
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }
}
