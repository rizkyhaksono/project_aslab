// import 'dart:js';

// import 'package:http/http.dart' as http;

// import 'dart:async';
// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:i_lab/Screens/Dashboard/main_dashboard.dart';
// import 'package:i_lab/Screens/Login/login_page_state.dart';

// var nimController = "";
// var passController = "";
// var access_token = "";

// class LoginContext {
//   Future<void> login() async {
//     if (passController.isNotEmpty && nimController.isNotEmpty) {
//       var response = await http.post(
//         Uri.parse(
//             // infotech api
//             "https://api.infotech.umm.ac.id/dotlab/api/v1/auth/student"),
//         body: ({
//           'username': nimController,
//           'password': passController,
//         }),
//       );

//       if (response.statusCode == 200) {
//         // direct to main page
//         // Timer(Duration(seconds: 1), (() {
//         //   Navigator.push(context,
//         //       MaterialPageRoute(builder: (context) => MainDashboard()));
//         // }));
//         Navigator.push(context,
//             MaterialPageRoute(builder: (context) => const MainDashboard()));
//         // print the data
//         // print("Response Status: ${response.statusCode}");
//         // print(nimController.text);
//         // print(passController.text);
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: const Text("Invalid Credentials")));
//       }
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text("Blank Field is Not Allowed!")));
//     }
//   }

// // fetch token to generate access_token
//   Future<void> accessToken() async {
//     http.post(
//         Uri.parse("https://api.infotech.umm.ac.id/dotlab/api/v1/auth/student"),
//         body: {
//           "username": nimController.text,
//           "password": passController.text,
//         }).then((response) {
//       try {
//         var jsonResponse = json.decode(response.body)['access_token'];

//         access_token = jsonResponse;
//         // print("Acces Token : $access_token");
//         accessData();
//       } catch (e) {
//         print("error");
//       }
//     });
//   }

// // fetch data user from api
//   Future<void> accessData() async {
//     http.post(Uri.parse("https://api.infotech.umm.ac.id/dotlab/api/v1/auth/me"),
//         body: {
//           "user_name": nimUser,
//           "email": emailUser,
//           "full_name": fullNameUser,
//         },
//         headers: {
//           "Authorization": "Bearer $access_token",
//         }).then((response) {
//       try {
//         var jsonResponse = json.decode(response.body)['user_name'],
//             jsonResponse2 = json.decode(response.body)['email'],
//             jsonResponse3 = json.decode(response.body)['full_name'];

//         // return to global variable
//         nimUser = jsonResponse;
//         emailUser = jsonResponse2;
//         fullNameUser = jsonResponse3;

//         login();

//         // debugging
//         // print("Email     : $emailUser");
//         // print("NIM       : $nimUser");
//         // print("Full Name : $fullNameUser");
//       } catch (e) {
//         print("error");
//       }
//     });
//   }
// }
