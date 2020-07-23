import 'package:countries_list/src/raw_countries_json.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:countries_list/countries_list.dart';

void main() async {
  int start = DateTime.now().millisecondsSinceEpoch;
  final countries = await getCountries();
  int end = DateTime.now().millisecondsSinceEpoch;
  print('countries count = ${countries.length}, time spent ${end - start} ms');
//  test('adds one to input values', () {
//
//  });
}
