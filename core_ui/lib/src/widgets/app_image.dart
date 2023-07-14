import 'dart:io';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import '../../core_ui.dart';

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
          return Center(
            child: CachedNetworkImage(
              imageUrl: _imageRef,
              width: _width,
              height: _height,
              progressIndicatorBuilder: (BuildContext context, String url,
                  DownloadProgress progress) {
                return const Center(
                  child: AppLoadingCircle(),
                );
              },
            ),
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
            child: const AppError(errorText: AppConstants.undefinedImageType),
          );
        }
    }
  }
}
