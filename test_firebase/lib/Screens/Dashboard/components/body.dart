// ignore_for_file: camel_case_types

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_firebase/Screens/Cart/cart_page.dart';
import 'package:test_firebase/Screens/Login/login_page_state.dart';
import 'package:test_firebase/Screens/ProfilUser/profil_page.dart';
import 'package:test_firebase/Screens/caution/caution.dart';
import 'package:test_firebase/constants.dart';

class bodydashboard extends StatefulWidget {
  const bodydashboard({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<bodydashboard> createState() => _bodydashboardState();
}

class _bodydashboardState extends State<bodydashboard> {
  double getHeight(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final EdgeInsets padding = MediaQuery.of(context).padding;
    return height - padding.bottom;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: backgroundcolor,
      child: SafeArea(
          top: true,
          child: Scaffold(
            body: Stack(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      height: getHeight(context),
                      width: size.width,
                      color: Colors.white,
                    ),
                    Container(
                      height: getHeight(context) / 4,
                      width: size.width,
                      decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            alignment: Alignment.topLeft,
                            height: getHeight(context) / 4 - 15,
                            width: size.width,
                            color: backgroundcolor,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    SizedBox(
                                      width: size.width * 0.25,
                                      child: Image.asset(
                                          "assets/images/logolabitnoback.png"),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(right: 25),
                                      width: 35,
                                      height: 35,
                                      decoration: BoxDecoration(
                                          color: const Color(0xFF2A84CA),
                                          borderRadius:
                                              BorderRadius.circular(7)),
                                      child: IconButton(
                                          padding: EdgeInsets.zero,
                                          alignment: Alignment.center,
                                          iconSize: 28,
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const ProfilPage()));
                                          },
                                          icon: const Icon(
                                            Icons.person,
                                            color: Colors.white,
                                          )),
                                    )
                                  ],
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  margin:
                                      const EdgeInsets.only(top: 10, left: 15),
                                  child: Text(
                                    "Hallo, $fullNameUser",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                )
                              ],
                            )),
                        SizedBox(
                          width: size.width,
                          child: Stack(
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        top: 60, left: 20),
                                    alignment: Alignment.center,
                                    height: 30,
                                    width: 180,
                                    child: const Text(
                                      "JAKET INFORMATIKA",
                                      style: TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.topLeft,
                                    margin: const EdgeInsets.only(
                                        top: 25, left: 20),
                                    width: 180,
                                    height: 190,
                                    child: const Text(
                                      "Febric : Premium cotton\n                combed \nColor   :  Gray \nFeels   : Soft & Comfortable \nSize      : S, M, L, XL \nWidth x Length x Chest \nS   (38cm x 58cm x 95cm) \nM  (41cm x 63cm x 100cm) \nL    (50cm x 69cm x 105cm)  \nXL (53cm x 71cm x 110cm)",
                                      style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ],
                              ),
                              Positioned(
                                right: 20,
                                top: 60,
                                child: Container(
                                    height: 160,
                                    width: size.width / 3,
                                    decoration: BoxDecoration(
                                        color: const Color(0xFFC4C4C4),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: CarouselSlider(
                                        items: [
                                          Image.asset(
                                              "assets/images/jaketdepan.png"),
                                          Image.asset(
                                              "assets/images/jaketbelakang.png")
                                        ],
                                        options: CarouselOptions(
                                            autoPlay: true,
                                            autoPlayInterval:
                                                const Duration(seconds: 5)))),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Stack(
                  children: <Widget>[
                    Positioned(
                        bottom: 0,
                        child:
                            SvgPicture.asset("assets/svg/wavebottomsvg.svg")),
                    Positioned(
                        bottom: 50,
                        right: 20,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => (isOrderDB == true)
                                        ? const Caution()
                                        : const CartPage()));
                          },
                          icon: const Icon(Icons.add_shopping_cart_outlined),
                          label: const Text(
                            "ORDER",
                            style: TextStyle(
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.bold),
                          ),
                          style: ButtonStyle(
                              foregroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              backgroundColor:
                                  MaterialStateProperty.resolveWith((states) =>
                                      states.any((element) =>
                                              element == MaterialState.pressed)
                                          ? const Color(0xFFDF610C)
                                          : const Color(0xFFFF6600)),
                              animationDuration:
                                  const Duration(milliseconds: 200),
                              minimumSize: MaterialStateProperty.all(
                                  Size(size.width / 3 + 8, size.height / 21)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)))),
                        ))
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
