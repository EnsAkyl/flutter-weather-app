import 'package:flutter/material.dart';
import 'package:weather_app/utils/extensions.dart';

class DisplayContainer extends StatelessWidget {
  const DisplayContainer({
    super.key,
    this.contaierHeight,
    this.contaierWidth,
    this.backgroundColor,
    required this.widget,
    this.borderRadius,
  });

  final double? contaierHeight;
  final double? contaierWidth;
  final Color? backgroundColor;
  final Widget widget;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      alignment: Alignment.center,
      height: context.deviceSize.height * (contaierHeight ?? 0.2),
      width: context.deviceSize.width * (contaierWidth ?? 0.95),
      decoration: BoxDecoration(
        color: backgroundColor ?? context.colorScheme.primaryContainer,
        borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 10)),
      ),
      child: widget,
    );
  }
}
