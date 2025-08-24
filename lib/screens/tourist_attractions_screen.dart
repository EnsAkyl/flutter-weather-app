import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/data/tab_item.dart';
import 'package:weather_app/providers/providers.dart';
import 'package:weather_app/utils/extensions.dart';
import 'package:weather_app/widgets/display_color_text.dart';

class TouristAttractionsScreen extends ConsumerWidget {
  static TouristAttractionsScreen builder(
    BuildContext context,
    GoRouterState state,
  ) => const TouristAttractionsScreen();

  const TouristAttractionsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = context.colorScheme;
    final selectedIndex = ref.watch(SelectedTabbarProvider);
    final currentCity = TabItemList.tabList[selectedIndex].title;
    final cityAsync = ref.watch(cityByNameProvider(currentCity));

    return Scaffold(
      appBar: AppBar(
        title: DisplayColorText(
          text: "Turistlik Mekanlar",
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
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
          final lon = double.tryParse(city.lng ?? '') ?? 0.0;
          final lat = double.tryParse(city.lat ?? '') ?? 0.0;
          final touristAsync = ref.watch(touristAttraction((lon,lat)));
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
              return ListView.builder(
                itemCount: touristData.features?.length ?? 0,
                itemBuilder: (context, index) {
                  final item = touristData.features![index];
                  final name = item.properties?.name;

                  if (name == null || name.isEmpty) {
                    return const SizedBox.shrink();
                  }
                  return Card(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    child: ExpansionTile(
                      backgroundColor: color.primary,
                      title: Row(
                        children: [
                          Icon(Icons.place, color: color.secondary, size: 24),
                          const Gap(9),
                          Text(
                            name,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      children: [
                        ListTile(
                          title: Text(
                            "Adres: ${item.properties?.formatted ?? "Adres Girilmemiş"}",
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
