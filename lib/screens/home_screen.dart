import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/data/card_header_data.dart';
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
      length: 11,
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
                padding: EdgeInsets.all(5),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 10,
                  childAspectRatio: 3 / 2,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      debugPrint("Tıklanan Kart : ${headerList[index].title}");
                    },
                    child: Card(
                      color: colors.primary,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              height: 70,
                              width: 70,
                              headerList[index].iconPath,
                            ),
                            DisplayColorText(
                              text: headerList[index].title,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                itemCount: headerList.length,
              ),
            ),
            Expanded(
              child: const TabBarView(
                children: [
                  Center(child: Text("Sayfa deneme2.")),
                  Center(child: Text("Sayfa deneme2.")),
                  Center(child: Text("Sayfa deneme3.")),
                  Center(child: Text("Sayfa deneme4.")),
                  Center(child: Text("Sayfa deneme5.")),
                  Center(child: Text("Sayfa deneme2.")),
                  Center(child: Text("Sayfa deneme2.")),
                  Center(child: Text("Sayfa deneme3.")),
                  Center(child: Text("Sayfa deneme4.")),
                  Center(child: Text("Sayfa deneme5.")),
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
