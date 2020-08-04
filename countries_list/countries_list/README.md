# countries_list

These lists are the result of parsing json data from this repo [ISO-3166-Countries-with-Regional-Codes](https://github.com/lukes/ISO-3166-Countries-with-Regional-Codes)

### **Main methods:**
```dart
// return list of all countries
Future<List<Country>> getCountriesIso();
```

```dart
// return list of all countries which has phone codes
Future<List<Country>> getCountriesOnlyWithPhoneCode();
```

### **Country class:**
```dart
class Country {
  final String latinName;
  final CountryIso countryIso;
  final String phoneCode;
  final String flag; //emoji flag

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
```

### **CountryIso class:**
```dart
class CountryIso {
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
}
```
