import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/data.dart';
import '../helpers/helpers.dart';

final touristAttraction = FutureProvider.family<TouristAttractions?, (double lon,double lat)>((ref,coords) async {
  final (lon,lat) = coords;

  final data = await getTouristAttractions(lon, lat);

  if(data == null){
    throw Exception("Veri alınamadı:" );
  }
  return TouristAttractions.fromJson(data);
});