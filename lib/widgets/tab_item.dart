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
          Text(
            textAlign: TextAlign.center,
            title,
            style: context.textTheme.labelMedium?.copyWith(
              fontSize: 10.8,
              fontWeight: FontWeight.bold,
              color: context.colorScheme.surface,
            ),
          ),
        ],
      ),
    );
  }
}

//Tab-Bar buton bilgileri
class TabItemList {
  static final List<TabItem> tabList = [
    TabItem(title: "Ankara"),
    TabItem(title: "İstanbul"),
    TabItem(title: "İzmir"),
    TabItem(title: "Mersin"),
    TabItem(title: "Trabzon"),
    TabItem(title: "Gaziantep"),
    TabItem(title: "Kırıkkale"),
    TabItem(title: "Samsun"),
    TabItem(title: "Bursa"),
    TabItem(title: "Erzurum"),
    TabItem(title: "Muğla"),
  ];
}
