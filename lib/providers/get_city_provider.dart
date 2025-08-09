import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/data/models/city_information_model.dart';
import 'package:weather_app/helpers/city_info_helpers.dart';

final cityByNameProvider = FutureProvider.family<CurrentCity?, String>((
  ref,
  cityName,
) {
  return getCityByName(cityName);
});
