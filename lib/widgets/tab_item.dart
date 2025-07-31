import 'package:flutter/material.dart';
import 'package:weather_app/utils/extensions.dart';

class TabItem extends StatelessWidget {
  const TabItem({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Text(
              textAlign: TextAlign.center,
              title,
              style: context.textTheme.labelMedium?.copyWith(
                fontSize: 10.8,
                fontWeight: FontWeight.bold,
                color: context.colorScheme.surface,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
