import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future getWeatherInformation(String cityName) async {
  try {
    final String? _weatherAPI = dotenv.env['WEATHER_API_KEY'];
    final dio = Dio();
    var url =
        "https://api.openweathermap.org/data/2.5/weather"
        "?q=$cityName"
        "&lang=tr"
        "&units=metric"
        "&appid=$_weatherAPI";

    var response = await dio.get(url);

    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('API hatası: Durum kodu ${response.statusCode}');
    }
  } catch (e) {
    throw Exception("Veri Çekme Hatası : $e");
  }
}
