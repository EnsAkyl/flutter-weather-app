import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/data/data.dart';
import 'package:weather_app/providers/providers.dart';
import 'package:weather_app/utils/extensions.dart';
import 'package:weather_app/widgets/display_color_text.dart';

class WeatherScreen extends ConsumerWidget {
  static WeatherScreen builder(BuildContext context, GoRouterState state) =>
      const WeatherScreen();
  final String cityName;
  const WeatherScreen(this.cityName, {super.key});

  Future _getWeatherInformation () async{
    final dio = Dio();

    var url = "https://api.openweathermap.org/data/2.5/weather?q={$cityName}&lang=tr&units=metric&appid=a5e198a15f7690402bcc44b9336d32c9";
    var responce = await dio.get(url);



  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final city = ref.watch(SelectedTabbarProvider);
    final cityName = TabItemList.tabList[city].title;
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
      body: Center(
        child: Text(
          textAlign: TextAlign.center,
          "$cityName -Hava Durumu Bilgisi 😶‍🌫️ 🧭",
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
