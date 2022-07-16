// ignore_for_file: non_constant_identifier_names, avoid_print

import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Dashboard/main_dashboard.dart';

class LoginPageState extends StatefulWidget {
  const LoginPageState({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

// global key for form validation
var access_token = "";
var emailUser = "";
var nimUser = "";
var fullNameUser = "";

// global key for database references
var isOrderDB;
var ukuranDB;
var jumlahDB;
var bankDB;

class _LoginPageState extends State<LoginPageState> {
  // nim, pass temporary data
  var nimController = TextEditingController();
  var passController = TextEditingController();
  bool liatPasssword = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(
          top: 100,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 200,
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Positioned(
                      top: 0,
                      width: size.width * 0.5,
                      child: Image.asset("assets/images/logolabitnoback.png"),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    margin: const EdgeInsets.only(
                        top: 20, bottom: 20, right: 40, left: 40),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: TextFormField(
                      style: const TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 12,
                          color: Colors.black),
                      controller: nimController,
                      decoration: const InputDecoration(
                        labelText: "NIM",
                        labelStyle: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                        icon: Icon(
                          Icons.person,
                          color: Colors.grey,
                          size: 24,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    width: size.width,
                    height: size.height / 14,
                    padding: const EdgeInsets.only(left: 20),
                    margin: const EdgeInsets.only(
                        top: 0, bottom: 0, right: 40, left: 40),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: TextFormField(
                      key: const ValueKey('Password'),
                      controller: passController,
                      style: const TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 12,
                          color: Colors.black),
                      decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle: const TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                          icon: const Icon(
                            Icons.lock,
                            color: Colors.grey,
                            size: 24,
                          ),
                          border: InputBorder.none,
                          suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  liatPasssword = !liatPasssword;
                                });
                              },
                              child: liatPasssword
                                  ? const Icon(Icons.visibility,
                                      color: Colors.grey)
                                  : const Icon(Icons.visibility_off,
                                      color: Colors.grey))),
                      obscureText: liatPasssword,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        accessToken();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 255, 102, 0),
                        minimumSize: const Size(100, 38),
                        alignment: Alignment.center,
                        animationDuration: const Duration(milliseconds: 200),
                        elevation: 5,
                        shape: const StadiumBorder(),
                      ),
                      // ignore: prefer_const_constructors
                      child: Text(
                        "Login",
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 260,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                            bottom: 0,
                            child: Image.asset(
                                "assets/images/iconwavebottom.png")),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // login function to get access token
  Future<void> login() async {
    if (passController.text.isNotEmpty && nimController.text.isNotEmpty) {
      var response = await http.post(
        Uri.parse(
            // infotech api
            "https://api.infotech.umm.ac.id/dotlab/api/v1/auth/student"),
        body: ({
          'username': nimController.text,
          'password': passController.text,
        }),
      );

      if (response.statusCode == 200) {
        // direct to main page
        // ignore: use_build_context_synchronously
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return const MainDashboard();
        }), (route) => false);
        // print the data
        print("Response Status: ${response.statusCode}");
        // print(nimController.text);
        // print(passController.text);
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("NIM atau Password salah!")));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("NIM dan Password harus di isi!")));
    }
  }

  // fetch token to generate access_token
  Future<void> accessToken() async {
    http.post(
        Uri.parse("https://api.infotech.umm.ac.id/dotlab/api/v1/auth/student"),
        body: {
          "username": nimController.text,
          "password": passController.text,
        }).then((response) {
      try {
        var jsonResponse = json.decode(response.body)['access_token'];

        access_token = jsonResponse;
        print("Acces Token : $access_token");
        accessData();
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("NIM atau Password anda salah!")));
      }
    });
  }

  // fetch data user from api
  Future<void> accessData() async {
    http.post(Uri.parse("https://api.infotech.umm.ac.id/dotlab/api/v1/auth/me"),
        body: {
          "user_name": nimUser,
          "email": emailUser,
          "full_name": fullNameUser,
        },
        headers: {
          "Authorization": "Bearer $access_token",
        }).then((response) {
      try {
        var jsonResponse = json.decode(response.body)['user_name'],
            jsonResponse2 = json.decode(response.body)['email'],
            jsonResponse3 = json.decode(response.body)['full_name'];

        // return to global variable
        nimUser = jsonResponse;
        emailUser = jsonResponse2;
        fullNameUser = jsonResponse3;
        login();

        // debugging
        print("Email     : $emailUser");
        print("NIM       : $nimUser");
        print("Full Name : $fullNameUser");

        var ref = FirebaseDatabase.instance.reference().child('JasAslab');

        ref.once().then((DataSnapshot snapshot) {
          isOrderDB = snapshot.value['isOrder'];
          ukuranDB = snapshot.value['ukuran'];
          jumlahDB = snapshot.value['jumlah'];
          print("Order : $isOrderDB");
          print("Ukuran : $ukuranDB");
          print("Jumlah : $jumlahDB");
        });
      } catch (e) {
        print("error");
      }
    });
  }

  // logout api
  Future<void> logout() async {
    await http.post(
        Uri.parse("https://api.infotech.umm.ac.id/dotlab/api/v1/auth/logout"),
        headers: {
          "Authorization": "Bearer $access_token",
        });
  }
}
