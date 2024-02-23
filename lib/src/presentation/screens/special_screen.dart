import 'dart:async';

import 'package:flutter/material.dart';
import 'package:bus_station_test/src/presentation/screens/auth.dart';

  class SpecialScreen extends StatefulWidget {
  @override
  _SpecialScreenState createState() => _SpecialScreenState();
  }

  class _SpecialScreenState extends State<SpecialScreen> {
  @override
  void initState() {
  super.initState();

  Timer(Duration(seconds: 10), () {
  Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => AuthScreen()),
  );
  });
  }

  @override
  Widget build(BuildContext context) {
  return Scaffold(
  appBar: AppBar(title: Text('SpecialScreen')),
  body: Center(
  child: Column (
    children: [
      Padding(padding: EdgeInsets.only(top: 100.0),),
      Image.asset('assets/images/image.png'),
      Text('May the force be with you!'),
    ],
  )
  ),
  );
  }
  }