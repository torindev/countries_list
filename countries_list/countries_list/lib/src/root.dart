import 'package:countries_list/src/country.dart';
import 'package:countries_list/src/country_iso.dart';
import 'package:countries_list/src/flags_emoji.dart';
import 'package:countries_list/src/phone_codes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;

/// return list of all countries
Future<List<Country>> getCountriesIso() async {
  List<CountryIso> countriesIso = await _getCountriesFromRawData();
  List<Country> result = [];
  for (CountryIso countryIso in countriesIso) {
    result.add(Country(
      latinName: countryIso.name,
      countryIso: countryIso,
      phoneCode: kPhones[countryIso.alpha2],
      flag: kFlagsEmoji[countryIso.alpha2],
    ));
  }
  return result;
}

/// return list of all countries which has phone codes
Future<List<Country>> getCountriesOnlyWithPhoneCode() async {
  List<CountryIso> countriesIso = await _getCountriesFromRawData();
  List<Country> result = [];
  for (CountryIso countryIso in countriesIso) {
    final c = Country(
      latinName: countryIso.name,
      countryIso: countryIso,
      phoneCode: kPhones[countryIso.alpha2],
      flag: kFlagsEmoji[countryIso.alpha2],
    );
    if (c.phoneCode != null && c.phoneCode.length > 0) {
      result.add(c);
    }
  }
  return result;
}

Future<List<CountryIso>> _getCountriesFromRawData() async {
//  String json = await rootBundle.loadString('assets/countries_row_json.txt');
  String json = await rootBundle
      .loadString('packages/countries_list/assets/countries_row_json.txt');
  return compute(countryIsoFromMap, json);
}
