import 'dart:convert';
import 'package:flutter/services.dart';
import '../data/models/models.dart';

Future<CurrentCity?> getCityByName(String cityName) async {
  final jsonCity = await rootBundle.loadString(
    "assets/data/city_information/turkiye_sehirleri_8_adet.json",
  );

  final List<dynamic> jsonList = json.decode(jsonCity);

  final List<CurrentCity> cities =
  jsonList.map((e) => CurrentCity.fromJson(e)).toList();

  try {
    return cities.firstWhere(
          (city) => city.city!.toLowerCase() == cityName.toLowerCase(),
    );
  } catch (e) {
    return null;
  }
}