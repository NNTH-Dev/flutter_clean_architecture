import 'package:flutter_clean_architecture/core/res/colors/app.colors.dart';
import 'package:flutter_clean_architecture/core/res/colors/base.colors.dart';
import 'package:flutter_clean_architecture/core/res/dimensions/app.dimensions.dart';
import 'package:flutter_clean_architecture/core/res/dimensions/base.dimensions.dart';
import 'package:flutter_clean_architecture/core/res/sizes/app.size.dart';
import 'package:flutter_clean_architecture/core/res/sizes/base.sizes.dart';
import 'package:flutter/material.dart';

class Resources {
  final BuildContext context;
  Resources(this.context);
  BaseColors get colors => AppColors();
  BaseSizes get sizes => AppSize();
  BaseDimensions get dimensions => AppDimensions();

  static Resources of(BuildContext context) {
    return Resources(context);
  }
}
