import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bus_station_test/src/data/repositories/tripsrepository.dart';
import 'package:bus_station_test/src/data/models/country.dart';

class TripsBloc extends Bloc<String, List<CountryData>> {
  final TripsRepository repository;


  TripsBloc(this.repository) : super([]);

  @override
  Stream<List<CountryData>> mapEventToState(String name) async* {
    try {
      final List<CountryData> countryData = await repository.getTrips(name);
      yield countryData;
    } catch (e) {
      throw Exception('Failed: $e');
    }
  }
}