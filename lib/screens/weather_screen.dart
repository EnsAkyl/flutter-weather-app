import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/data/data.dart';
import 'package:weather_app/providers/providers.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/utils/extensions.dart';
import 'package:weather_app/widgets/display_color_text.dart';

class WeatherScreen extends ConsumerWidget {
  static WeatherScreen builder(BuildContext context, GoRouterState state) =>
      const WeatherScreen();

  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final city = ref.watch(SelectedTabbarProvider);
    final cityName = TabItemList.tabList[city].title;
    final cityAsync = ref.watch(weatherProvider(cityName));
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: context.colorScheme.surface),
        title: DisplayColorText(
          text: "$cityName - Hava Durumu",
          fontWeight: FontWeight.bold,
          fontSize: 20,
          textColor: context.colorScheme.surface,
        ),
      ),
      body: cityAsync.when(
        error:
            (err, stack) => Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(child: Text("Hata Oluştu :$err")),
            ),
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (weather) {
          if (weather == null) {
            return const Center(child: Text("Veri Alınamadı!"));
          }
          return Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text("Hava: ${weather.weather![0].description ?? "---"}"),
                    const Gap(20),
                    Image.network("https://openweathermap.org/img/wn/${weather.weather![0].icon}@2x.png",)
                  ],
                ),
                Text("Sıcaklık: ${weather.main?.temp?.toStringAsFixed(1) ?? "---"} °C"),
                const Gap(10),
                Text("Hissedilen Sıcaklık: ${weather.main?.feelsLike?.toString() ?? "---"} °C"),
                const Gap(10),
                Text("Nem: %${weather.main?.humidity ?? "---"}"),
                const Gap(10),
                Text("Rüzhar Hızı: ${weather.wind?.speed ?? "---"} km/h")




              ],
            ),
          );
        },
      ),
    );
  }
}
