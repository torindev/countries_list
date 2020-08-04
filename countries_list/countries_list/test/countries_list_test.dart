import 'package:countries_list/countries_list.dart';
import 'package:countries_list/src/country_iso.dart';
import 'package:countries_list/src/root.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('Test parse json', () async {
    int resultLength = 0;
    try {
      int start = DateTime.now().millisecondsSinceEpoch;
      final countries = await getCountriesIso();
      int end = DateTime.now().millisecondsSinceEpoch;
      resultLength = countries?.length ?? 0;
      print('countries count = ${resultLength}, time spent ${end - start} ms');
    } catch (error) {
      print('error = ${error.toString()}');
    }
    expect(resultLength, 249);
  });

  test('Test country content', () {
    String target = 'abc123';
    List<Country> testList = [
      Country(latinName: target),
      Country(phoneCode: target),
      Country(countryIso: CountryIso(alpha2: target)),
      Country(countryIso: CountryIso(alpha3: target)),
    ];

    List<Country> results = [];
    testList.forEach((element) {
      if (element.contains(target)) {
        results.add(element);
      }
    });
    expect(results.length, testList.length);
  });
}
