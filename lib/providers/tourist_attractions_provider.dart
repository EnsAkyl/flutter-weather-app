import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/data.dart';
import '../helpers/helpers.dart';

final touristAttraction = FutureProvider.family<TouristAttractions?, CurrentCity>((ref,city) async {
  final double lat = double.tryParse(city.lat ?? '') ?? 0.0;
  final double lon = double.tryParse(city.lng ?? '') ?? 0.0;

  final data = await getTouristAttractions(lon, lat);

  if(data == null){
    throw Exception("Veri alınamadı:" );
  }
  return TouristAttractions.fromJson(data);
});