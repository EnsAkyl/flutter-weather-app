import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
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
              child: GridView.builder(
                padding: EdgeInsets.all(1),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 0.3,
                  mainAxisSpacing: 10,
                  childAspectRatio: 3 / 1.2,
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
                          color: isSelected ? colors.primaryContainer : colors.primary,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: SvgPicture.asset(
                                    height: 70,
                                    width: 70,
                                    headerList[index].iconPath,
                                  ),
                                ),
                                Expanded(
                                  child: DisplayColorText(
                                    text: headerList[index].title,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
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
              child: TabBarView(
                children: [
                  Center(
                    child: Text(
                      "Seçilen TabBar Değeri : ${TabItemList.tabList[ref.watch(SelectedTabbarProvider)].title } ve Seçilen Card: ${ref.watch(SelectedCardProvider)}",
                    ),
                  ),
                  Center(
                    child: Text(
                      "Seçilen TabBar Değeri : ${TabItemList.tabList[ref.watch(SelectedTabbarProvider)].title}",
                    ),
                  ),
                  Center(
                    child: Text(
                      "Seçilen TabBar Değeri : ${TabItemList.tabList[ref.watch(SelectedTabbarProvider)].title}",
                    ),
                  ),
                  Center(
                    child: Text(
                      "Seçilen TabBar Değeri : ${TabItemList.tabList[ref.watch(SelectedTabbarProvider)].title}",
                    ),
                  ),
                  Center(
                    child: Text(
                      "Seçilen TabBar Değeri : ${TabItemList.tabList[ref.watch(SelectedTabbarProvider)].title}",
                    ),
                  ),
                  Center(
                    child: Text(
                      "Seçilen TabBar Değeri : ${TabItemList.tabList[ref.watch(SelectedTabbarProvider)].title}",
                    ),
                  ),
                  Center(child: Text("Sayfa deneme2.")),
                  Center(child: Text("Sayfa deneme3.")),
                  Center(child: Text("Sayfa deneme4.")),
                  Center(child: Text("Sayfa deneme5.")),
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
