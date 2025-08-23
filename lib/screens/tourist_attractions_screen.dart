import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/data/tab_item.dart';
import 'package:weather_app/providers/providers.dart';
import 'package:weather_app/utils/extensions.dart';

class TouristAttractionsScreen extends ConsumerWidget {
  static TouristAttractionsScreen builder(
    BuildContext context,
    GoRouterState state,
  ) => const TouristAttractionsScreen();

  const TouristAttractionsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = context.colorScheme;
    final deviceSize = context.deviceSize;
    final selectedIndex = ref.watch(SelectedTabbarProvider);
    final currentCity = TabItemList.tabList[selectedIndex].title;
    final cityAsync = ref.watch(cityByNameProvider(currentCity));

    return Scaffold(
      appBar: AppBar(
        title: Text("Turistlik Mekanlar"),
        centerTitle: true,
        iconTheme: IconThemeData(color: color.surface),
      ),
      body: cityAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error:
            (err, stack) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Text("Şehir Verisi Alınamadı: $err")),
            ),
        data: (city) {
          if (city == null) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Center(child: Text("Şehir Bulunamadı.")),
            );
          }
          final touristAsync = ref.watch(touristAttraction(city));

          return touristAsync.when(
            error:
                (err, stack) => Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Turistik Veriler Alınamadı: $err"),
                  ),
                ),
            loading: () => const Center(child: CircularProgressIndicator()),
            data: (touristData) {
              if (touristData == null) {
                return const Center(child: Text("Veri Alınamadı!"));
              }
              return Center();
            },
          );
        },
      ),
    );
  }
}
