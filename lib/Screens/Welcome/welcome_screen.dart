import 'dart:async';

import 'package:flutter/material.dart';
import 'package:i_lab/Screens/Login/components/body.dart';
import 'package:i_lab/Screens/Login/components/login_button_field.dart';
import 'package:i_lab/Screens/Login/login_screen.dart';
import 'components/body.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(
        const Duration(seconds: 3),
        (() => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
              builder: (BuildContext context) {
                return LoginPage(); // diganti
              },
            ), (route) => false)));
    return const Scaffold(
      body: Body(),
    );
  }
}
