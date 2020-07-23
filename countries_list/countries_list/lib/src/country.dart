import 'package:flutter/foundation.dart';

class Country {
  final String alpha2;
  final String alpha3;
  final String latinName;
  final String localizedName;
  final String phoneCode;
  final String flag;

  const Country({
    @required this.alpha2,
    @required this.alpha3,
    @required this.latinName,
    @required this.localizedName,
    @required this.phoneCode,
    @required this.flag,
  });
}
