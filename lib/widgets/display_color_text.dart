import 'package:flutter/material.dart';
import 'package:weather_app/utils/utils.dart';

class DisplayColorText extends StatelessWidget {
  const DisplayColorText({
    super.key,
    required this.text,
    this.textColor,
    this.fontSize,
    this.fontWeight,
    this.textAlign,
  });

  final String text;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    final color = context.colorScheme;
    final textTheme = context.textTheme;

    return Text(
      text,
      textAlign: textAlign,
      style: textTheme.titleLarge?.copyWith(
        color: textColor ?? color.surface,
        fontWeight: fontWeight ?? FontWeight.normal,
        fontSize: fontSize ?? 23,
      ),
    );
  }
}
