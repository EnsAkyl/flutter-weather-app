import 'package:dio/dio.dart';

Future getWeatherInformation(String cityName) async {
  try {
    const apiKey = String.fromEnvironment('API_KEY_WEATHER');
    final dio = Dio();
    var url =
        "https://api.openweathermap.org/data/2.5/weather"
        "?q=$cityName"
        "&lang=tr"
        "&units=metric"
        "&appid=a5e198a15f7690402bcc44b9336d32c9";

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
