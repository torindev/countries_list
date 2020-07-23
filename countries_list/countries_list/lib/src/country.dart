import 'package:countries_list/src/country_iso.dart';
import 'package:flutter/foundation.dart';

class Country {
  final String latinName;
  final CountryIso countryIso;
  final String phoneCode;
  final String flag;

  Country({
    @required this.latinName,
    @required this.countryIso,
    @required this.phoneCode,
    @required this.flag,
  });

  @override
  String toString() {
    return '$latinName (${countryIso.alpha2}), +$phoneCode, $flag';
  }

  bool contains(String t) {
    try {
      return latinName.toLowerCase().contains(t.toLowerCase()) ||
          phoneCode.toLowerCase().contains(t.toLowerCase()) ||
          countryIso.alpha2.toLowerCase().contains(t.toLowerCase()) ||
          countryIso.alpha3.toLowerCase().contains(t.toLowerCase());
    } catch (error) {
      return false;
    }
  }
}
