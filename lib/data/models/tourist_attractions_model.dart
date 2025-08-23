import 'dart:convert';

TouristAttractions touristAttractionsFromJson(String str) => TouristAttractions.fromJson(json.decode(str));

String touristAttractionsToJson(TouristAttractions data) => json.encode(data.toJson());

class TouristAttractions {
  final String? type;
  final List<Feature>? features;

  TouristAttractions({
    this.type,
    this.features,
  });

  factory TouristAttractions.fromJson(Map<String, dynamic> json) => TouristAttractions(
    type: json["type"],
    features: json["features"] == null ? [] : List<Feature>.from(json["features"]!.map((x) => Feature.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "features": features == null ? [] : List<dynamic>.from(features!.map((x) => x.toJson())),
  };
}

class Feature {
  final String? type;
  final Properties? properties;
  final Geometry? geometry;

  Feature({
    this.type,
    this.properties,
    this.geometry,
  });

  factory Feature.fromJson(Map<String, dynamic> json) => Feature(
    type: json["type"],
    properties: json["properties"] == null ? null : Properties.fromJson(json["properties"]),
    geometry: json["geometry"] == null ? null : Geometry.fromJson(json["geometry"]),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "properties": properties?.toJson(),
    "geometry": geometry?.toJson(),
  };
}

class Geometry {
  final String? type;
  final List<double>? coordinates;

  Geometry({
    this.type,
    this.coordinates,
  });

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
    type: json["type"],
    coordinates: json["coordinates"] == null ? [] : List<double>.from(json["coordinates"]!.map((x) => x?.toDouble())),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "coordinates": coordinates == null ? [] : List<dynamic>.from(coordinates!.map((x) => x)),
  };
}

class Properties {
  final String? name;
  final String? country;
  final String? countryCode;
  final String? state;
  final String? county;
  final String? city;
  final String? iso31662;
  final double? lon;
  final double? lat;
  final String? formatted;
  final String? addressLine1;
  final String? addressLine2;
  final List<String>? categories;
  final List<String>? details;
  final Datasource? datasource;
  final NameOther? nameOther;
  final NameInternational? nameInternational;
  final WikiAndMedia? wikiAndMedia;
  final Historic? historic;
  final String? placeId;
  final String? town;
  final String? postcode;
  final String? suburb;
  final String? street;
  final Way? way;
  final String? village;
  final Building? building;
  final PlaceOfWorship? placeOfWorship;

  Properties({
    this.name,
    this.country,
    this.countryCode,
    this.state,
    this.county,
    this.city,
    this.iso31662,
    this.lon,
    this.lat,
    this.formatted,
    this.addressLine1,
    this.addressLine2,
    this.categories,
    this.details,
    this.datasource,
    this.nameOther,
    this.nameInternational,
    this.wikiAndMedia,
    this.historic,
    this.placeId,
    this.town,
    this.postcode,
    this.suburb,
    this.street,
    this.way,
    this.village,
    this.building,
    this.placeOfWorship,
  });

  factory Properties.fromJson(Map<String, dynamic> json) => Properties(
    name: json["name"],
    country: json["country"],
    countryCode: json["country_code"],
    state: json["state"],
    county: json["county"],
    city: json["city"],
    iso31662: json["iso3166_2"],
    lon: json["lon"]?.toDouble(),
    lat: json["lat"]?.toDouble(),
    formatted: json["formatted"],
    addressLine1: json["address_line1"],
    addressLine2: json["address_line2"],
    categories: json["categories"] == null ? [] : List<String>.from(json["categories"]!.map((x) => x)),
    details: json["details"] == null ? [] : List<String>.from(json["details"]!.map((x) => x)),
    datasource: json["datasource"] == null ? null : Datasource.fromJson(json["datasource"]),
    nameOther: json["name_other"] == null ? null : NameOther.fromJson(json["name_other"]),
    nameInternational: json["name_international"] == null ? null : NameInternational.fromJson(json["name_international"]),
    wikiAndMedia: json["wiki_and_media"] == null ? null : WikiAndMedia.fromJson(json["wiki_and_media"]),
    historic: json["historic"] == null ? null : Historic.fromJson(json["historic"]),
    placeId: json["place_id"],
    town: json["town"],
    postcode: json["postcode"],
    suburb: json["suburb"],
    street: json["street"],
    way: json["way"] == null ? null : Way.fromJson(json["way"]),
    village: json["village"],
    building: json["building"] == null ? null : Building.fromJson(json["building"]),
    placeOfWorship: json["place_of_worship"] == null ? null : PlaceOfWorship.fromJson(json["place_of_worship"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "country": country,
    "country_code": countryCode,
    "state": state,
    "county": county,
    "city": city,
    "iso3166_2": iso31662,
    "lon": lon,
    "lat": lat,
    "formatted": formatted,
    "address_line1": addressLine1,
    "address_line2": addressLine2,
    "categories": categories == null ? [] : List<dynamic>.from(categories!.map((x) => x)),
    "details": details == null ? [] : List<dynamic>.from(details!.map((x) => x)),
    "datasource": datasource?.toJson(),
    "name_other": nameOther?.toJson(),
    "name_international": nameInternational?.toJson(),
    "wiki_and_media": wikiAndMedia?.toJson(),
    "historic": historic?.toJson(),
    "place_id": placeId,
    "town": town,
    "postcode": postcode,
    "suburb": suburb,
    "street": street,
    "way": way?.toJson(),
    "village": village,
    "building": building?.toJson(),
    "place_of_worship": placeOfWorship?.toJson(),
  };
}

class Building {
  final String? type;

  Building({
    this.type,
  });

  factory Building.fromJson(Map<String, dynamic> json) => Building(
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
  };
}

class Datasource {
  final String? sourcename;
  final String? attribution;
  final String? license;
  final String? url;
  final Raw? raw;

  Datasource({
    this.sourcename,
    this.attribution,
    this.license,
    this.url,
    this.raw,
  });

  factory Datasource.fromJson(Map<String, dynamic> json) => Datasource(
    sourcename: json["sourcename"],
    attribution: json["attribution"],
    license: json["license"],
    url: json["url"],
    raw: json["raw"] == null ? null : Raw.fromJson(json["raw"]),
  );

  Map<String, dynamic> toJson() => {
    "sourcename": sourcename,
    "attribution": attribution,
    "license": license,
    "url": url,
    "raw": raw?.toJson(),
  };
}

class Raw {
  final String? name;
  final int? osmId;
  final String? nameCa;
  final String? nameDe;
  final String? nameEl;
  final String? nameEn;
  final String? nameFr;
  final String? nameKa;
  final String? nameNl;
  final String? nameRu;
  final String? tourism;
  final String? altName;
  final String? historic;
  final String? osmType;
  final String? wikidata;
  final String? wikipedia;
  final int? layer;
  final String? bridge;
  final String? highway;
  final String? surface;
  final int? zOrder;
  final String? officialName;
  final String? barrier;
  final String? ruins;
  final String? addrCity;
  final String? castleType;
  final int? addrPostcode;
  final String? wikimediaCommons;
  final String? amenity;
  final String? nameAr;
  final String? building;
  final String? religion;
  final String? denomination;

  Raw({
    this.name,
    this.osmId,
    this.nameCa,
    this.nameDe,
    this.nameEl,
    this.nameEn,
    this.nameFr,
    this.nameKa,
    this.nameNl,
    this.nameRu,
    this.tourism,
    this.altName,
    this.historic,
    this.osmType,
    this.wikidata,
    this.wikipedia,
    this.layer,
    this.bridge,
    this.highway,
    this.surface,
    this.zOrder,
    this.officialName,
    this.barrier,
    this.ruins,
    this.addrCity,
    this.castleType,
    this.addrPostcode,
    this.wikimediaCommons,
    this.amenity,
    this.nameAr,
    this.building,
    this.religion,
    this.denomination,
  });

  factory Raw.fromJson(Map<String, dynamic> json) => Raw(
    name: json["name"],
    osmId: json["osm_id"],
    nameCa: json["name:ca"],
    nameDe: json["name:de"],
    nameEl: json["name:el"],
    nameEn: json["name:en"],
    nameFr: json["name:fr"],
    nameKa: json["name:ka"],
    nameNl: json["name:nl"],
    nameRu: json["name:ru"],
    tourism: json["tourism"],
    altName: json["alt_name"],
    historic: json["historic"],
    osmType: json["osm_type"],
    wikidata: json["wikidata"],
    wikipedia: json["wikipedia"],
    layer: json["layer"],
    bridge: json["bridge"],
    highway: json["highway"],
    surface: json["surface"],
    zOrder: json["z_order"],
    officialName: json["official_name"],
    barrier: json["barrier"],
    ruins: json["ruins"],
    addrCity: json["addr:city"],
    castleType: json["castle_type"],
    addrPostcode: json["addr:postcode"],
    wikimediaCommons: json["wikimedia_commons"],
    amenity: json["amenity"],
    nameAr: json["name:ar"],
    building: json["building"],
    religion: json["religion"],
    denomination: json["denomination"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "osm_id": osmId,
    "name:ca": nameCa,
    "name:de": nameDe,
    "name:el": nameEl,
    "name:en": nameEn,
    "name:fr": nameFr,
    "name:ka": nameKa,
    "name:nl": nameNl,
    "name:ru": nameRu,
    "tourism": tourism,
    "alt_name": altName,
    "historic": historic,
    "osm_type": osmType,
    "wikidata": wikidata,
    "wikipedia": wikipedia,
    "layer": layer,
    "bridge": bridge,
    "highway": highway,
    "surface": surface,
    "z_order": zOrder,
    "official_name": officialName,
    "barrier": barrier,
    "ruins": ruins,
    "addr:city": addrCity,
    "castle_type": castleType,
    "addr:postcode": addrPostcode,
    "wikimedia_commons": wikimediaCommons,
    "amenity": amenity,
    "name:ar": nameAr,
    "building": building,
    "religion": religion,
    "denomination": denomination,
  };
}

class Historic {
  final String? type;
  final bool? ruins;
  final String? castleType;

  Historic({
    this.type,
    this.ruins,
    this.castleType,
  });

  factory Historic.fromJson(Map<String, dynamic> json) => Historic(
    type: json["type"],
    ruins: json["ruins"],
    castleType: json["castle_type"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "ruins": ruins,
    "castle_type": castleType,
  };
}

class NameInternational {
  final String? ca;
  final String? de;
  final String? el;
  final String? en;
  final String? fr;
  final String? ka;
  final String? nl;
  final String? ru;
  final String? ar;

  NameInternational({
    this.ca,
    this.de,
    this.el,
    this.en,
    this.fr,
    this.ka,
    this.nl,
    this.ru,
    this.ar,
  });

  factory NameInternational.fromJson(Map<String, dynamic> json) => NameInternational(
    ca: json["ca"],
    de: json["de"],
    el: json["el"],
    en: json["en"],
    fr: json["fr"],
    ka: json["ka"],
    nl: json["nl"],
    ru: json["ru"],
    ar: json["ar"],
  );

  Map<String, dynamic> toJson() => {
    "ca": ca,
    "de": de,
    "el": el,
    "en": en,
    "fr": fr,
    "ka": ka,
    "nl": nl,
    "ru": ru,
    "ar": ar,
  };
}

class NameOther {
  final String? altName;
  final String? officialName;

  NameOther({
    this.altName,
    this.officialName,
  });

  factory NameOther.fromJson(Map<String, dynamic> json) => NameOther(
    altName: json["alt_name"],
    officialName: json["official_name"],
  );

  Map<String, dynamic> toJson() => {
    "alt_name": altName,
    "official_name": officialName,
  };
}

class PlaceOfWorship {
  final String? religion;
  final String? denomination;

  PlaceOfWorship({
    this.religion,
    this.denomination,
  });

  factory PlaceOfWorship.fromJson(Map<String, dynamic> json) => PlaceOfWorship(
    religion: json["religion"],
    denomination: json["denomination"],
  );

  Map<String, dynamic> toJson() => {
    "religion": religion,
    "denomination": denomination,
  };
}

class Way {
  final bool? bridge;
  final String? surface;

  Way({
    this.bridge,
    this.surface,
  });

  factory Way.fromJson(Map<String, dynamic> json) => Way(
    bridge: json["bridge"],
    surface: json["surface"],
  );

  Map<String, dynamic> toJson() => {
    "bridge": bridge,
    "surface": surface,
  };
}

class WikiAndMedia {
  final String? wikidata;
  final String? wikipedia;
  final String? wikimediaCommons;

  WikiAndMedia({
    this.wikidata,
    this.wikipedia,
    this.wikimediaCommons,
  });

  factory WikiAndMedia.fromJson(Map<String, dynamic> json) => WikiAndMedia(
    wikidata: json["wikidata"],
    wikipedia: json["wikipedia"],
    wikimediaCommons: json["wikimedia_commons"],
  );

  Map<String, dynamic> toJson() => {
    "wikidata": wikidata,
    "wikipedia": wikipedia,
    "wikimedia_commons": wikimediaCommons,
  };
}
