// ignore_for_file: non_constant_identifier_names, avoid_print

import 'dart:convert';
import 'package:test_firebase/Screens/Login/login_page_state.dart';
import 'package:test_firebase/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import '../Dashboard/main_dashboard.dart';
import 'package:http/http.dart' as http;

var message_logout = "";

launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Request time out';
  }
}

class ProfilPage extends StatefulWidget {
  const ProfilPage({Key? key}) : super(key: key);

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: size.width,
            height: size.height / 4,
            decoration: BoxDecoration(
                color: backgroundcolor,
                borderRadius: BorderRadius.circular(15)),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  height: 30,
                  width: 30,
                  margin: const EdgeInsets.only(bottom: 90, right: 340),
                  child: IconButton(
                    onPressed: () {
                      // ganti ke main dasboard
                      Navigator.pop(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MainDashboard()));
                    },
                    icon: const Icon(Icons.arrow_back_outlined),
                    color: Colors.white,
                  ),
                ),
                Container(
                  width: size.width / 4,
                  height: size.height / 8,
                  decoration: BoxDecoration(
                      color: const Color(0xFF2A84CA),
                      borderRadius: BorderRadius.circular(100)),
                  child: const Icon(
                    Icons.person,
                    size: 70,
                    color: Color(0xFFC4C4C4),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 130),
                  child: Text(
                    fullNameUser,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            height: size.height / 5.6,
            width: size.width - 40,
            decoration: BoxDecoration(
                color: const Color(0xFFC4C4C4),
                borderRadius: BorderRadius.circular(25)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 20, top: 20),
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.white),
                      child: const Icon(
                        Icons.person,
                        size: 30,
                        color: kPrimaryDarkColor,
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(top: 10, left: 20),
                      height: 25,
                      width: size.width - 160,
                      child: Text(
                        nimUser,
                        style: const TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Poppins",
                            fontSize: 14),
                      ),
                    )
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  width: size.width - 80,
                  height: size.height / 220,
                  decoration: BoxDecoration(
                      color: kPrimaryDarkColor,
                      borderRadius: BorderRadius.circular(25)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10, left: 20),
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.white),
                      child: const Icon(
                        Icons.email,
                        color: kPrimaryDarkColor,
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(top: 5, left: 20),
                      height: 25,
                      width: size.width - 160,
                      child: Text(
                        emailUser,
                        style: const TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Poppins",
                            fontSize: 14),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            height: size.height / 13,
            width: size.width - 40,
            decoration: BoxDecoration(
              color: const Color(0xFFC4C4C4),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 20, top: 0),
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.white),
                  child: const Icon(
                    Icons.phone,
                    size: 30,
                    color: kPrimaryDarkColor,
                  ),
                ),
                Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(top: 0, left: 20),
                    height: size.height / 25,
                    width: size.width - 160,
                    child: TextButton(
                      style: TextButton.styleFrom(
                          splashFactory: NoSplash.splashFactory),
                      onPressed: () {
                        const url =
                            'https://instagram.com/labit.umm?igshid=YmMyMTA2M2Y=';
                        launchURL(url);
                      },
                      child: const Text(
                        "About Us",
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Poppins",
                            fontSize: 14),
                      ),
                    ))
              ],
            ),
          ),
          OutlinedButton.icon(
            // logout button
            onPressed: () {
              logout();
            },
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.red[400],
              size: 18,
            ),
            label: Text(
              "Logout",
              style: TextStyle(color: Colors.red[400]),
            ),
          )
        ],
      ),
    );
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
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const LoginPageState()),
            (route) => false);
      } catch (e) {
        print("error");
      }
    });
  }
}
