import 'package:bus_station_test/src/data/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bus_station_test/src/data/repositories/tripsrepository.dart';
import 'package:bus_station_test/src/data/models/country.dart';

import '../widgets/custombutton.dart';

class MainScreen extends StatefulWidget {

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late TextEditingController _nameController;
  late TripsBloc _tripsBloc;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _tripsBloc = TripsBloc(TripsRepository());
    // _tripsBloc.add('');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _tripsBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Главный экран'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/signin');
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            CustomButton(
              onPressed: () {
                _tripsBloc.add(_nameController.text);
              },
              text: 'Найти',
            ),
            BlocBuilder<TripsBloc, List<CountryData>>(
              bloc: _tripsBloc,
              builder: (context, state) {
                if (state.isEmpty) {
                  return Center(child: Text('Нет данных'));
                } else {
                  return RefreshIndicator(
                    onRefresh: () async {
                      _tripsBloc.add(_nameController.text);
                    },
                    child: SizedBox(
                      height: 600,
                      child: ListView.builder(
                        itemCount: state.length,
                        itemBuilder: (context, index) {
                          var trip = state[index];
                          return ListTile(
                            title: Text(trip.countryId),
                            subtitle: Text('${trip.probability}'),
                          );
                        },
                      ),
                    )
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}