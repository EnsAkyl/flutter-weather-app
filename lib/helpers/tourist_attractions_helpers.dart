import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future getTouristAttractions(double lon,double lat) async {
  try {
    final String? _touristAttractionsAPI = dotenv.env['TOURIST_ATTRACTIONS'];
    final dio = Dio();
    var url = "https://api.geoapify.com/v2/places"
        "?categories=tourism.sights"
        "&filter=circle:39.7225,41.0050,20000"
        "&limit=500"
        "&apiKey=$_touristAttractionsAPI";

    var response = await dio.get(url);

    if(response.statusCode == 200){
      return response.data;
    } else{
      throw Exception('API Hatası: Durum ${response.statusCode}');
    }
  }catch(e){
    throw Exception("Veri Çekme Hatası : $e");

  }
}