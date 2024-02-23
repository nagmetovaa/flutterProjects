import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/custombutton.dart';


class AuthScreen extends StatelessWidget {

  void _launchURL() async {
    const url = 'https://www.google.com';
    await launch(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Авторизация'),
      ),
      body: Center(
        child: Column (
          children: [
            Padding(padding: EdgeInsets.only(top: 530.0),),
            CustomButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/mainscreen');
                },
                text: 'Get started',
            ),
            Padding(padding: EdgeInsets.only(top: 10.0),),
            CustomButton(
                onPressed: () {
                  _launchURL();
                },
                text: 'Terms and Conditions',
            ),
          ],
        )
      ),
    );
  }
}