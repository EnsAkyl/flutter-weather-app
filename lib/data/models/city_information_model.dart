import 'dart:convert';

CurrentCity currentCityFromJson(String str) =>
    CurrentCity.fromJson(json.decode(str));

String currentCityToJson(CurrentCity data) => json.encode(data.toJson());

class CurrentCity {
  final String? city;
  final String? lat;
  final String? lng;
  final String? country;
  final String? iso2;
  final String? adminName;
  final String? capital;
  final String? population;
  final String? populationProper;
  final String? location;
  final String? explain;
  final String? famous_dish;

  CurrentCity({
    this.city,
    this.lat,
    this.lng,
    this.country,
    this.iso2,
    this.adminName,
    this.capital,
    this.population,
    this.populationProper,
    this.location,
    this.explain,
    this.famous_dish
  });

  factory CurrentCity.fromJson(Map<String, dynamic> json) => CurrentCity(
    city: json["city"],
    lat: json["lat"],
    lng: json["lng"],
    country: json["country"],
    iso2: json["iso2"],
    adminName: json["admin_name"],
    capital: json["capital"],
    population: json["population"],
    populationProper: json["population_proper"],
    location: json["location"],
    explain: json["explain"],
    famous_dish: json["famous_dish"]
  );

  Map<String, dynamic> toJson() => {
    "city": city,
    "lat": lat,
    "lng": lng,
    "country": country,
    "iso2": iso2,
    "admin_name": adminName,
    "capital": capital,
    "population": population,
    "population_proper": populationProper,
    "location": location,
    "explain": explain,
    "famous_dish": famous_dish
  };
}
