import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/data/data.dart';
import 'package:weather_app/providers/providers.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/utils/extensions.dart';
import 'package:weather_app/utils/wind_direction.dart';
import 'package:weather_app/widgets/display_color_text.dart';
import 'package:weather_app/widgets/display_container.dart';

class WeatherScreen extends ConsumerWidget {
  static WeatherScreen builder(BuildContext context, GoRouterState state) =>
      const WeatherScreen();

  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = context.colorScheme;
    final deviceSize = context.deviceSize;
    final city = ref.watch(SelectedTabbarProvider);
    final cityName = TabItemList.tabList[city].title;
    final cityAsync = ref.watch(weatherProvider(cityName));
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: context.colorScheme.surface),
        title: DisplayColorText(
          text: "Hava Durumu",
          fontWeight: FontWeight.bold,
          fontSize: 20,
          textColor: color.surface,
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
          return Container(
            width: deviceSize.width,
            height: deviceSize.height,
            color: context.colorScheme.primaryContainer,
            padding: EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                DisplayContainer(
                  contaierHeight: 0.08,
                  contaierWidth: 0.95,
                  backgroundColor: color.surface,
                  widget: DisplayColorText(
                    text: "$cityName",
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    textColor: color.shadow,
                  ),
                ),
                const Gap(10),
                DisplayContainer(
                  contaierHeight: 0.2,
                  contaierWidth: 0.95,
                  backgroundColor: color.surface,
                  widget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DisplayColorText(
                        text:
                            "${weather.main?.temp?.toStringAsFixed(1) ?? "---"}° ",
                        fontSize: 33,
                        //fontWeight: FontWeight.bold,
                        textColor: color.shadow,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Image.network(
                              "https://openweathermap.org/img/wn/${weather.weather![0].icon}@2x.png",
                              height: 55,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: DisplayColorText(
                              text:
                                  "Hava ${weather.weather![0].description ?? "---"}",
                              textColor: context.colorScheme.shadow,
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Gap(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: DisplayContainer(
                        backgroundColor: color.surface,
                        contaierWidth: 0.50,
                        contaierHeight: 0.25,
                        widget: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.water_drop, size: 45),
                            const Gap(10),
                            DisplayColorText(
                              text: "${weather.main?.humidity ?? "---"}%",
                              textColor: color.shadow,
                              fontSize: 15,
                            ),
                            const Gap(15),
                            DisplayColorText(
                              text:
                                  "Hissedilen: ${weather.main?.feelsLike?.toString() ?? "---"}°C",
                              textColor: color.shadow,
                              fontSize: 15,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Gap(10),
                    Expanded(
                      child: DisplayContainer(
                        backgroundColor: color.surface,
                        contaierWidth: 0.50,
                        contaierHeight: 0.25,
                        widget: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.air, size: 45),
                            const Gap(10),
                            DisplayColorText(
                              text: "${weather.wind?.speed ?? "---"} km/h",
                              textColor: color.shadow,
                              fontSize: 15,
                            ),
                            const Gap(15),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,

                              children: [
                                DisplayColorText(
                                  text: WindDirection.fromDegree(
                                    weather.wind?.deg,
                                  ),
                                  textColor: color.shadow,
                                  fontSize: 15,
                                ),
                                const Gap(5),
                                Transform.rotate(
                                  angle:
                                      (weather.wind?.deg ?? 0) *
                                      math.pi /
                                      180,
                                  child: Icon(
                                    Icons.navigation,
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
