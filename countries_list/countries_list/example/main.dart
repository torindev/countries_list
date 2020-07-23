import 'package:countries_list/countries_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Countries list'),
        ),
        body: FutureBuilder<List<Country>>(
          future: getCountriesIso(),
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              final countries = snapshot.data;
              return ListView.builder(
                itemBuilder: (ctx, index) {
                  Country country = countries[index];
                  return ListTile(
                    leading: Text(
                      country.flag,
                      style: TextStyle(fontSize: 32),
                    ),
                    title: Text(
                        '${country.latinName} (${country.countryIso.alpha2})'),
                    subtitle: Text('phone code: +${country.phoneCode}'),
                  );
                },
                itemCount: countries.length,
              );
            }
          },
        ),
      ),
    );
  }
}
