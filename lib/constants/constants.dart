import 'package:flutter/material.dart';

const double relativeWidth = 390.0;

double rw(BuildContext context) {
  final double width = MediaQuery.of(context).size.width;
  final double height = MediaQuery.of(context).size.height;
  final double deviceWidth = width > height ? height : width;

  return deviceWidth / relativeWidth;
}

double grw(BuildContext context) {
  final double scaledValue = rw(context);
  return scaledValue < 1 ? 1 : scaledValue;
}
