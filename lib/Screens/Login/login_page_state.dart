import 'dart:convert';

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

class _LoginPageState extends State<LoginPageState> {
  // nim, pass temporary data
  var nimController = TextEditingController();
  var passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(
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
                    Container(
                      padding: const EdgeInsets.only(bottom: 0),
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      width: size.width * 0.5,
                      child: Positioned(
                        top: 70,
                        child: Image.asset("assets/images/logolabitnoback.png"),
                        width: size.width * 0.5,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    margin: EdgeInsets.only(
                        top: 20, bottom: 20, right: 40, left: 40),
                    child: TextFormField(
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 12,
                          color: Colors.black),
                      controller: nimController,
                      decoration: InputDecoration(
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
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    margin:
                        EdgeInsets.only(top: 0, bottom: 0, right: 40, left: 40),
                    child: TextFormField(
                      controller: passController,
                      obscureText: true,
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 12,
                          color: Colors.black),
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                        icon: Icon(
                          Icons.lock,
                          color: Colors.grey,
                          size: 24,
                        ),
                        border: InputBorder.none,
                        suffixIcon: Icon(
                          Icons.visibility,
                          color: Colors.grey,
                          size: 24.0,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        login();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 255, 102, 0),
                        minimumSize: const Size(100, 38),
                        alignment: Alignment.center,
                        animationDuration: const Duration(milliseconds: 200),
                        elevation: 5,
                        shape: const StadiumBorder(),
                      ),
                      child: Text(
                        "Login",
                        style: TextStyle(
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

      accessToken();
      accessData();

      if (response.statusCode == 200) {
        // direct to main page
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MainDashboard()));
        // print the data
        print("Response Status: ${response.statusCode}");
        // print(nimController.text);
        // print(passController.text);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Invalid Credentials")));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Blank Field is Not Allowed!")));
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
      } catch (e) {
        print("error");
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

        // debugging
        print("Email     : $emailUser");
        print("NIM       : $nimUser");
        print("Full Name : $fullNameUser");
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
