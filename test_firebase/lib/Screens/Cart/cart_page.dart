import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_firebase/Screens/Dashboard/main_dashboard.dart';
import 'package:test_firebase/Screens/Database/storage_service.dart';
import 'package:test_firebase/Screens/Login/login_page_state.dart';
import 'package:test_firebase/Screens/paymentMethod/payment.dart';
import 'package:test_firebase/constants.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

List<String> items = ['S', 'M', 'XL', 'XXL'];
String? selectedItem;
String HargaJaket = "150.000";

class _CartPageState extends State<CartPage> {
  double getHeight(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final EdgeInsets padding = MediaQuery.of(context).padding;
    return height - padding.bottom;
  }

  // initializing the database
  final Storage storage = Storage();
  final databaseRef = FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: backgroundcolor,
      child: SafeArea(
        top: true,
        child: Scaffold(
            appBar: AppBar(
              toolbarHeight: 76,
              leading: Container(
                margin: const EdgeInsets.only(bottom: 9, left: 10),
                height: 66,
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MainDashboard()));
                    databaseRef.child("JasAslab").set({
                      'isOrder': false,
                      'ukuran': null,
                      'jumlah': null,
                    });
                  },
                ),
              ),
              title: Container(
                margin: const EdgeInsets.only(bottom: 9),
                height: 66,
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Cart",
                  style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              flexibleSpace: Stack(
                children: [
                  Container(
                    height: 76,
                    decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  Container(
                    height: 66,
                    color: backgroundcolor,
                  ),
                ],
              ),
              elevation: 0,
              backgroundColor: const Color(0xFFC4C4C4),
            ),
            body: Container(
                height: getHeight(context),
                width: size.width,
                color: Colors.white,
                child: Stack(
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: getHeight(context) / 5,
                          width: size.width,
                          color: const Color(0xFFC4C4C4),
                          child: CarouselSlider(
                            items: [
                              Image.asset("assets/images/jaketdepan.png"),
                              Image.asset("assets/images/jaketbelakang.png")
                            ],
                            options: CarouselOptions(
                                autoPlay: true,
                                autoPlayInterval: const Duration(seconds: 5)),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          height: 22,
                          width: 138,
                          child: const Text(
                            "Payment Details",
                            style: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          height: 22,
                          width: 138,
                          child: const Text(
                            "Name",
                            style: TextStyle(
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w600,
                                fontSize: 14),
                          ),
                        ),
                        Center(
                            child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          alignment: Alignment.centerLeft,
                          height: 41,
                          width: size.width - 41,
                          decoration: BoxDecoration(
                              color: const Color(0xFFE2E8F0),
                              borderRadius: BorderRadius.circular(8)),
                          child: Text(fullNameUser),
                        )),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          height: 22,
                          width: 138,
                          child: const Text(
                            "NIM",
                            style: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Center(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            alignment: Alignment.centerLeft,
                            height: 41,
                            width: size.width - 41,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: const Color(0xFFE2E8F0)),
                            child: Text(nimUser),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          height: 22,
                          width: 138,
                          child: const Text(
                            "Size",
                            style: TextStyle(
                                fontFamily: "Monstsserat",
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Center(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            height: 41,
                            width: size.width - 41,
                            decoration: BoxDecoration(
                                color: const Color(0xFFE2E8F0),
                                borderRadius: BorderRadius.circular(8)),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                isExpanded: true,
                                value: selectedItem,
                                items: items
                                    .map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(item,
                                            style:
                                                const TextStyle(fontSize: 14))))
                                    .toList(),
                                onChanged: (item) => setState(
                                  () => selectedItem = item,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              height: 17,
                              width: size.width / 7,
                              child: const Text(
                                "Total",
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              height: 17,
                              width: size.width / 5,
                              child: Text(
                                "Rp.$HargaJaket",
                                style: const TextStyle(
                                    fontFamily: "Monstesserat",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 20),
                              height: getHeight(context) / 25,
                              width: size.width / 3,
                              child: TextButton(
                                  style: TextButton.styleFrom(
                                    elevation: 0,
                                    primary: Colors.transparent,
                                    splashFactory: NoSplash.splashFactory,
                                  ),
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const MainDashboard()));

                                    databaseRef.child("JasAslab").set({
                                      'isOrder': false,
                                      'ukuran': null,
                                      'jumlah': null,
                                    });
                                  },
                                  child: const Text(
                                    "Cancel Order",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "Montserrat",
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  )),
                            ),
                            Container(
                                margin: const EdgeInsets.only(right: 20),
                                height: getHeight(context) / 25,
                                width: size.width / 3,
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        foregroundColor: MaterialStateProperty.all(
                                            Colors.white),
                                        backgroundColor:
                                            MaterialStateProperty.resolveWith((states) =>
                                                states.any((element) => element == MaterialState.pressed)
                                                    ? const Color(0xFFDF610C)
                                                    : const Color(0xFFFF6600)),
                                        animationDuration:
                                            const Duration(milliseconds: 200),
                                        minimumSize: MaterialStateProperty.all(
                                            const Size(206, 43)),
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)))),
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Payment()));

                                      print("Anda memilih : $selectedItem");
                                    },
                                    child: const Text(
                                      "Check Out",
                                      style: TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.normal,
                                          fontSize: 14),
                                    )))
                          ],
                        )
                      ],
                    ),
                    Positioned(
                        bottom: 0,
                        child:
                            SvgPicture.asset("assets/svg/wavebottomsvg.svg")),
                  ],
                ))),
      ),
    );
  }
}
