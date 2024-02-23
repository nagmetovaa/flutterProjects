import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:bus_station_test/src/data/models/country.dart';

class TripsRepository {
  Future<List<CountryData>> getTrips(String name) async {
    try {
      final dio = Dio();
      final response = await dio.get('https://api.nationalize.io/', queryParameters: {'name': name}
      );
      if (response.statusCode == 200) {
        var jsonData = response.data as Map<String, dynamic>;
        final List<dynamic> countryDataList = jsonData['country'];
        if (countryDataList != null) {
          final List<CountryData> parsedCountryData = countryDataList
              .map((data) => CountryData.fromJson(data))
              .toList();
          return parsedCountryData;
        }
      }
      throw Exception('Failed to load trips');
    } catch (e) {
      throw Exception('Failed to load trips: $e');
    }
  }
  }