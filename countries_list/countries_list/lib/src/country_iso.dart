import 'package:flutter/foundation.dart';
import 'dart:convert';

List<CountryIso> countryIsoFromMap(String str) =>
    List<CountryIso>.from(json.decode(str).map((x) => CountryIso.fromMap(x)));

String countryIsoToMap(List<CountryIso> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class CountryIso {
  CountryIso({
    @required this.name,
    @required this.alpha2,
    @required this.alpha3,
    @required this.countryCode,
    @required this.iso31662,
    @required this.region,
    @required this.subRegion,
    @required this.intermediateRegion,
    @required this.regionCode,
    @required this.subRegionCode,
    @required this.intermediateRegionCode,
  });

  final String name;
  final String alpha2;
  final String alpha3;
  final String countryCode;
  final String iso31662;
  final Region region;
  final String subRegion;
  final IntermediateRegion intermediateRegion;
  final String regionCode;
  final String subRegionCode;
  final String intermediateRegionCode;

  CountryIso copyWith({
    String name,
    String alpha2,
    String alpha3,
    String countryCode,
    String iso31662,
    Region region,
    String subRegion,
    IntermediateRegion intermediateRegion,
    String regionCode,
    String subRegionCode,
    String intermediateRegionCode,
  }) =>
      CountryIso(
        name: name ?? this.name,
        alpha2: alpha2 ?? this.alpha2,
        alpha3: alpha3 ?? this.alpha3,
        countryCode: countryCode ?? this.countryCode,
        iso31662: iso31662 ?? this.iso31662,
        region: region ?? this.region,
        subRegion: subRegion ?? this.subRegion,
        intermediateRegion: intermediateRegion ?? this.intermediateRegion,
        regionCode: regionCode ?? this.regionCode,
        subRegionCode: subRegionCode ?? this.subRegionCode,
        intermediateRegionCode:
            intermediateRegionCode ?? this.intermediateRegionCode,
      );

  factory CountryIso.fromMap(Map<String, dynamic> json) => CountryIso(
        name: json["name"] == null ? null : json["name"],
        alpha2: json["alpha-2"] == null ? null : json["alpha-2"],
        alpha3: json["alpha-3"] == null ? null : json["alpha-3"],
        countryCode: json["country-code"] == null ? null : json["country-code"],
        iso31662: json["iso_3166-2"] == null ? null : json["iso_3166-2"],
        region:
            json["region"] == null ? null : regionValues.map[json["region"]],
        subRegion: json["sub-region"] == null ? null : json["sub-region"],
        intermediateRegion: json["intermediate-region"] == null
            ? null
            : intermediateRegionValues.map[json["intermediate-region"]],
        regionCode: json["region-code"] == null ? null : json["region-code"],
        subRegionCode:
            json["sub-region-code"] == null ? null : json["sub-region-code"],
        intermediateRegionCode: json["intermediate-region-code"] == null
            ? null
            : json["intermediate-region-code"],
      );

  Map<String, dynamic> toMap() => {
        "name": name == null ? null : name,
        "alpha-2": alpha2 == null ? null : alpha2,
        "alpha-3": alpha3 == null ? null : alpha3,
        "country-code": countryCode == null ? null : countryCode,
        "iso_3166-2": iso31662 == null ? null : iso31662,
        "region": region == null ? null : regionValues.reverse[region],
        "sub-region": subRegion == null ? null : subRegion,
        "intermediate-region": intermediateRegion == null
            ? null
            : intermediateRegionValues.reverse[intermediateRegion],
        "region-code": regionCode == null ? null : regionCode,
        "sub-region-code": subRegionCode == null ? null : subRegionCode,
        "intermediate-region-code":
            intermediateRegionCode == null ? null : intermediateRegionCode,
      };
}

enum IntermediateRegion {
  EMPTY,
  MIDDLE_AFRICA,
  CARIBBEAN,
  SOUTH_AMERICA,
  CENTRAL_AMERICA,
  WESTERN_AFRICA,
  SOUTHERN_AFRICA,
  EASTERN_AFRICA,
  CHANNEL_ISLANDS
}

final intermediateRegionValues = EnumValues({
  "Caribbean": IntermediateRegion.CARIBBEAN,
  "Central America": IntermediateRegion.CENTRAL_AMERICA,
  "Channel Islands": IntermediateRegion.CHANNEL_ISLANDS,
  "Eastern Africa": IntermediateRegion.EASTERN_AFRICA,
  "": IntermediateRegion.EMPTY,
  "Middle Africa": IntermediateRegion.MIDDLE_AFRICA,
  "Southern Africa": IntermediateRegion.SOUTHERN_AFRICA,
  "South America": IntermediateRegion.SOUTH_AMERICA,
  "Western Africa": IntermediateRegion.WESTERN_AFRICA
});

enum Region { ASIA, EUROPE, AFRICA, OCEANIA, AMERICAS, EMPTY }

final regionValues = EnumValues({
  "Africa": Region.AFRICA,
  "Americas": Region.AMERICAS,
  "Asia": Region.ASIA,
  "": Region.EMPTY,
  "Europe": Region.EUROPE,
  "Oceania": Region.OCEANIA
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
