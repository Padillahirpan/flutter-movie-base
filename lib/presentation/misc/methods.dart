import 'package:flutter/widgets.dart';

Map<double, SizedBox> _verticalSpace = {};
Map<double, SizedBox> _horizontalSpace = {};

SizedBox verticalSpace(double height) {
  if (_verticalSpace.containsKey(height)) {
    return _verticalSpace[height]!;
  } else {
    final space = SizedBox(height: height);
    _verticalSpace[height] = space;
    return space;
  }
}

SizedBox horizontalSpace(double width) {
  if (_horizontalSpace.containsKey(width)) {
    return _horizontalSpace[width]!;
  } else {
    final space = SizedBox(width: width);
    _horizontalSpace[width] = space;
    return space;
  }
}
