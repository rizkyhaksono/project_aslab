import 'package:flutter/material.dart';
import 'package:i_lab/constants.dart';
import 'Screens/Welcome/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth',
      theme: ThemeData(
        primaryColor: backgroundcolor,
        //Warna Background aplikasi
        scaffoldBackgroundColor: backgroundcolor,
      ),
      home: const WelcomeScreen(),
    );
  }
}
