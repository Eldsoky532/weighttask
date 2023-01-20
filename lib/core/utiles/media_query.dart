import 'package:flutter/cupertino.dart';

extension MediaQueryValues on BuildContext{
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
  double get topPadding => MediaQuery.of(this).padding.top;
  double get bottomPadding => MediaQuery.of(this).padding.bottom;
  double get leftPadding => MediaQuery.of(this).padding.left;
  double get rightPadding => MediaQuery.of(this).padding.right;
  double get horizontalPadding => MediaQuery.of(this).padding.horizontal;
  double get verticalPadding => MediaQuery.of(this).padding.vertical;

}