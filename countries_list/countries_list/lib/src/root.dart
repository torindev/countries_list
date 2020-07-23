import 'package:countries_list/src/country.dart';
import 'package:countries_list/src/country_iso.dart';
import 'package:countries_list/src/flags_emoji.dart';
import 'package:countries_list/src/phone_codes.dart';
import 'package:countries_list/src/raw_countries_json.dart';

Future<List<Country>> getCountries() async {
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
