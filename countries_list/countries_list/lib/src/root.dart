import 'package:countries_list/src/country.dart';
import 'package:countries_list/src/country_iso.dart';
import 'package:countries_list/src/flags_emoji.dart';
import 'package:countries_list/src/phone_codes.dart';
import 'package:countries_list/src/raw_countries_json.dart';

/// return list of all countries
Future<List<Country>> getCountriesIso() async {
  List<CountryIso> countriesIso = countryIsoFromMap(kCountriesJson);
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
  List<CountryIso> countriesIso = countryIsoFromMap(kCountriesJson);
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
