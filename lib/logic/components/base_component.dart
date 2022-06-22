import 'package:flutter/material.dart';
import 'enums.dart';

class BaseComponent {
  Map<String, dynamic> style;

  BaseComponent({
    Map<String, dynamic>? style,
  }) : style = style ??
            {
              "backgroundColor": Colors.amber,
              "fontColor": Colors.black,
              "fontFamily": TextFontFamily.system,
              "fontSize": 20.0,
              "fontWeight": TextFontWeight.regular,
              "alignment": TextAlignment.left,
              "indent": 8.0,
              "type": TextType.body,
              "quote": false,
              "block": false,
              "strikethrough": false,
              "bullet": Bullet.none,
              "resized": false,
            };
}
