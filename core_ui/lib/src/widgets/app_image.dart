import 'dart:io';

import 'package:core_ui/src/theme/themes.dart';
import 'package:flutter/material.dart';

class AppImage extends StatelessWidget {
  final String _imageRef;
  final double _width;
  final double _height;

  const AppImage(
      {super.key,
      required String imageRef,
      required double width,
      required double height})
      : _imageRef = imageRef,
        _width = width,
        _height = height;

  String getType() {
    if (_imageRef.startsWith('http://') || _imageRef.startsWith('https://')) {
      return 'network';
    }
    if (_imageRef.endsWith('.png') ||
        _imageRef.endsWith('.svg') ||
        _imageRef.endsWith('.jpg') ||
        _imageRef.endsWith('.jpeg')) {
      return 'memory';
    }

    return 'undefined';
  }

  @override
  Widget build(BuildContext context) {
    switch (getType()) {
      case 'network':
        {
          return Image.network(
            _imageRef,
            width: _width,
            height: _height,
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return Center(
                child: Container(
                  padding: const EdgeInsets.all(AppDimens.PADDING_50),
                  width: _width,
                  height: _height,
                  child: CircularProgressIndicator(
                    strokeWidth: AppDimens.WIDTH_25,
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                ),
              );
            },
          );
        }
      case 'memory':
        {
          return Image.file(
            File(_imageRef),
            width: _width,
            height: _height,
          );
        }
      default:
        {
          return SizedBox(
              width: _width,
              height: _height,
              child: Center(
                child: Text(
                  textAlign: TextAlign.center,
                  AppConstants.UNDEFINED_IMAGE_TYPE,
                  style: AppFonts.bold25.copyWith(
                    color: AppColors.RED,
                  ),
                ),
              ),
            );
        }
    }
  }
}
