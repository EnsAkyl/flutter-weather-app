import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/data/city_information.dart';
import 'package:weather_app/data/data.dart';
import 'package:weather_app/providers/providers.dart';
import 'package:weather_app/utils/utils.dart';
import 'package:weather_app/widgets/widgets.dart';

class HomeScreen extends ConsumerWidget {
  static HomeScreen builder(BuildContext context, GoRouterState state) =>
      const HomeScreen();

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colorScheme;
    final deviceSize = context.deviceSize;
    final textTheme = context.textTheme;
    final headerList = CardHeaderData.headerList;
    return DefaultTabController(
      length: TabItemList.tabList.length,
      child: Scaffold(
        appBar: AppBar(
          title: DisplayColorText(
            text: "Rüzgarlı Rotalar",
            /*Güneşli Duraklar,Güneşli Duraklar ,Güneşli Geziler,Güneş Takipçisi,Havada Gezi* gibi isimler olabilir.*/
            textColor: context.colorScheme.surface,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          centerTitle: true,
          toolbarHeight: context.deviceSize.height * 0.05,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(40),
            child: Container(
              height: deviceSize.height * 0.05,
              margin: const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: context.colorScheme.primaryContainer,
              ),
              child: TabBar(
                onTap: (index) {
                  ref.read(SelectedCardProvider.notifier).state = null;
                  ref.read(SelectedTabbarProvider.notifier).state = index;
                  debugPrint(
                    "Seçilen TabBar Item : ${TabItemList.tabList[index].title}",
                  );
                },
                tabAlignment: TabAlignment.center,
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: Colors.transparent,
                isScrollable: true,
                indicator: BoxDecoration(
                  color: colors.secondary,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                tabs: TabItemList.tabList,
              ),
            ),
          ),
        ),

        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: GridView.builder(
                padding: EdgeInsets.all(1),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 0.3,
                  mainAxisSpacing: 10,
                  childAspectRatio: 5 / 3,
                ),
                itemBuilder: (context, index) {
                  return Consumer(
                    builder: (context, ref, child) {
                      final selectedCardIndex = ref.watch(SelectedCardProvider);
                      final isSelected = selectedCardIndex == index;
                      return GestureDetector(
                        onTap: () {
                          ref.read(SelectedCardProvider.notifier).state = index;
                        },
                        child: Card(
                          color:
                              isSelected
                                  ? colors.primaryContainer
                                  : colors.primary,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,

                                children: [
                                  Expanded(
                                    child: SvgPicture.asset(
                                      height: 50,
                                      width: 50,
                                      headerList[index].iconPath,
                                    ),
                                  ),
                                  Expanded(
                                    child: DisplayColorText(
                                      text: headerList[index].title,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                itemCount: headerList.length,
              ),
            ),
            Expanded(
              flex: 7,
              child: TabBarView(
                children: [
                  CityInformation(cityName: "Ankara"),
                  CityInformation(cityName: "İstanbul"),
                  CityInformation(cityName: "Mersin"),
                  CityInformation(cityName: "Trabzon"),
                  CityInformation(cityName: "Gaziantep"),
                  CityInformation(cityName: "Bursa"),
                  CityInformation(cityName: "Erzurum"),
                  CityInformation(cityName: "Muğla"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/**/
