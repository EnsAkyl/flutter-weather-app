import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
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
    return DefaultTabController(
      length: 11,
      child: Scaffold(
        appBar: AppBar(
          title: DisplayColorText(
            text: "Hava Durumu",
            textColor: context.colorScheme.surface,
            fontWeight: FontWeight.bold,
            fontSize: 18,
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


                //labelColor: Colors.white,  ---- tab_item.dart dosyasındaki text style'da context kullandığım için bütün tabbar'da baskın oldu.
                //unselectedLabelColor: Colors.black,
                tabs: TabItemList.tabList,
              ),
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: const Text("Sayfa deneme2.")),
            Center(child: const Text("Sayfa deneme2.")),
            Center(child: const Text("Sayfa deneme3.")),
            Center(child: const Text("Sayfa deneme4.")),
            Center(child: const Text("Sayfa deneme5.")),
            Center(child: const Text("Sayfa deneme2.")),
            Center(child: const Text("Sayfa deneme2.")),
            Center(child: const Text("Sayfa deneme3.")),
            Center(child: const Text("Sayfa deneme4.")),
            Center(child: const Text("Sayfa deneme5.")),
            Center(child: const Text("Sayfa deneme5.")),
          ],
        ),
      ),
    );
  }
}

/**/
