import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:test_firebase/Screens/Login/login_page_state.dart';

var message_logout = "";

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
          Text("Welcome User $fullNameUser"),
          Text("NIM : $nimUser"),
          Text("Email : $emailUser"),
          SizedBox(
            height: 20,
          ),
          OutlinedButton.icon(
            // logout button
            onPressed: () {
              logout();
              // Navigator.pushReplacement(context,
              //     MaterialPageRoute(builder: (context) => LoginPageState()));
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

  Future<void> logout() async {
    http.post(
        Uri.parse("https://api.infotech.umm.ac.id/dotlab/api/v1/auth/logout"),
        headers: {
          "Authorization": "Bearer $access_token",
        }).then((access) {
      try {
        var jsonResponse = json.decode(access.body)['message'];
        // return to global variable
        message_logout = jsonResponse;
        // debugging
        print("Message     : $message_logout");
        // return to login page
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPageState()));
      } catch (e) {
        print("error");
      }
    });
  }
}
