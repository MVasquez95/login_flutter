import 'package:flutter/material.dart';

class MyStyles {
  /* EDGE INSETS */
  static const EdgeInsets bodyMargin =
      EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0);

  /* GENERAL */

  static const double appBarHeight = 50.0;

  /* BORDER RADIUS */
  static const BorderRadius borderRadiusAll2 =
      BorderRadius.all(Radius.circular(2.0));
  static const BorderRadius borderRadiusAll5 =
      BorderRadius.all(Radius.circular(5.0));
  static const BorderRadius borderRadiusAll6 =
      BorderRadius.all(Radius.circular(6.0));
  static const Radius radius10 = Radius.circular(10.0);
  static const Radius radius20 = Radius.circular(20.0);
  static const BorderRadius borderRadiusAll11 =
      BorderRadius.all(Radius.circular(11.0));
  static const BorderRadius borderRadius5 =
      BorderRadius.all(Radius.circular(5.0));
  static const BorderRadius borderRadius10 =
      BorderRadius.all(Radius.circular(10.0));
  static const BorderRadius borderRadius20 =
      BorderRadius.all(Radius.circular(20.0));
  static const BorderRadius borderRadiusAll20 =
      BorderRadius.all(Radius.circular(20.0));
  static const BorderRadius borderRadiusAll100 =
      BorderRadius.all(Radius.circular(100.0));
  static const BorderRadius borderRadiusTop6 = BorderRadius.only(
      topRight: Radius.circular(6.0), topLeft: Radius.circular(6.0));

  /* TEXT STYLE */

  //color_size_weight_decoration_font

  static const TextStyle primary_13 = TextStyle(
      color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.w500);

  static const TextStyle primary_button = TextStyle(
      color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.w500);

  static const TextStyle Text1_bold_30 = TextStyle(
      color: Colors.black, fontSize: 30.0, fontWeight: FontWeight.bold);

  static const TextStyle BodyText_semiMedium_15 = TextStyle(
      color: Colors.grey, fontSize: 16.0, fontWeight: FontWeight.w500);
}
