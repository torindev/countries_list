import 'package:countries_list/src/root.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  try {
    int start = DateTime.now().millisecondsSinceEpoch;
    final countries = await getCountriesIso();
    int end = DateTime.now().millisecondsSinceEpoch;
    print(
        'countries count = ${countries.length}, time spent ${end - start} ms');
  } catch (error) {
    print('error = ${error.toString()}');
  }
}
