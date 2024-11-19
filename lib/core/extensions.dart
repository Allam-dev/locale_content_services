import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
  double ofSH(double value) => height * value;
  double ofSW(double value) => width * value;
}