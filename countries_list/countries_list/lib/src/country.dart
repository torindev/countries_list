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
}
