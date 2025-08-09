import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/data/data.dart';
import 'package:weather_app/helpers/helpers.dart';

final weatherProvider = FutureProvider.family<CurrentWeather?, String>((ref, cityName,) async {
  final data = await getWeatherInformation(cityName);
  if(data==null){
    throw Exception("Veri alınamadı: $cityName için API'den dönüş boş geldi.");
  }
  return CurrentWeather.fromJson(data);
});
