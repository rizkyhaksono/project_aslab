import 'dart:ui';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:i_lab/Screens/Login/login_page_state.dart';

class MainDashboard extends StatefulWidget {
  const MainDashboard({Key? key}) : super(key: key);

  @override
  State<MainDashboard> createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // main page
          Text("Welcome User ${fullNameUser}"),
          Text("NIM : ${nimUser}"),
          Text("Email : ${emailUser}"),
          SizedBox(
            height: 50,
          ),
          OutlinedButton.icon(
            // logout button
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.exit_to_app,
              size: 18,
            ),
            label: Text("Logout"),
          )
        ],
      ),
    )));
  }
}
