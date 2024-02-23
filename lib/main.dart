import 'package:flutter/material.dart';
import 'package:bus_station_test/src/presentation/screens/auth.dart';
import 'package:bus_station_test/src/presentation/screens/main_screen.dart';
import 'package:bus_station_test/src/presentation/screens/special_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Colors.green,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        textTheme: TextTheme(bodyText2: TextStyle(color: Colors.black)),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SpecialScreen(),
        '/signin': (context) => AuthScreen(),
        '/mainscreen': (context) => MainScreen(),
      },
    );
  }
}
