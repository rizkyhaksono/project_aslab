import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_firebase/Screens/BuktiTransfer/buktiTF_body.dart';
import 'package:test_firebase/Screens/Cart/cart_page.dart';
import 'package:test_firebase/Screens/Dashboard/main_dashboard.dart';
import 'package:test_firebase/Screens/Login/login_page_state.dart';
import 'package:test_firebase/constants.dart';

class Caution extends StatefulWidget {
  const Caution({Key? key}) : super(key: key);

  @override
  State<Caution> createState() => _CautionState();
}

class _CautionState extends State<Caution> {
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
            backgroundColor: Colors.white,
            leading: Container(
              margin: const EdgeInsets.only(bottom: 9, left: 10),
              height: 66,
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MainDashboard()));
                },
              ),
            ),
            title: Container(
              margin: const EdgeInsets.only(bottom: 9),
              height: 66,
              alignment: Alignment.centerLeft,
              child: const Text(
                "Pembelian Barang",
                style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            flexibleSpace: Stack(children: [
              Container(
                height: 76,
                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(8)),
              ),
              Container(
                height: 66,
                color: backgroundcolor,
              )
            ]),
            elevation: 0,
          ),
          body: Stack(
            children: [
              Container(
                height: size.height,
                width: size.width,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(vertical: 30),
                      height: size.height / 18,
                      width: size.width - 80,
                      decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(8)),
                      child: const Text(
                        "Anda Sudah  Melakukan Pembelian",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Poppins",
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomLeft,
                      padding: const EdgeInsets.only(left: 5),
                      height: size.height / 18,
                      width: size.width - 80,
                      child: const Text(
                        "Details",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Center(
                      child: Container(
                        margin: const EdgeInsets.only(top: 5),
                        height: size.height / 5,
                        width: size.width - 80,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            border: Border(
                                bottom: BorderSide(
                                    color: Color(0xFFC4C4C4), width: 2.0),
                                top: BorderSide(
                                    color: Color(0xFFC4C4C4), width: 2.0))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: size.height / 6,
                              width: size.width / 4 + 20,
                              decoration: BoxDecoration(
                                  color: const Color(0xFFC4C4C4),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Image.asset(
                                  "assets/images/jaketbelakang.png"),
                            ),
                            SizedBox(
                              height: size.height / 6,
                              width: size.width / 2 - 19,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    width: size.width / 2 - 11.9,
                                    height: size.height / 23,
                                    color: Colors.white,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          alignment: Alignment.centerLeft,
                                          height: size.height / 23,
                                          width: size.width / 7,
                                          color: Colors.white,
                                          child: Text(
                                            ukuranDB,
                                            style: const TextStyle(
                                                fontFamily: "Poppins",
                                                fontWeight: FontWeight.w500,
                                                fontSize: 24,
                                                color: Colors.black),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.centerRight,
                                          height: size.height / 23,
                                          width: size.width / 5,
                                          color: Colors.white,
                                          child: const Text(
                                            "x1",
                                            style: TextStyle(
                                                fontFamily: "Poppins",
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16,
                                                color: Colors.black),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    height: size.height / 20,
                                    width: size.width / 2 - 12,
                                    color: Colors.white,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: size.height / 44,
                                              width: size.width / 7,
                                              color: Colors.white,
                                              child: const Text(
                                                "Payment",
                                                style: TextStyle(
                                                    fontFamily: "Poppins",
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 12,
                                                    color: Color(0xFFC4C4C4)),
                                              ),
                                            ),
                                            Container(
                                              height: size.height / 37,
                                              width: size.width / 5,
                                              color: Colors.white,
                                              child: Text(
                                                "$bankDB",
                                                style: const TextStyle(
                                                    fontFamily: "Poppins",
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 16),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          alignment: Alignment.bottomCenter,
                                          height: size.height / 22,
                                          width: size.width / 7 + 10,
                                          color: Colors.white,
                                          child: Text(
                                            "Rp.$HargaJaket",
                                            style: const TextStyle(
                                                fontFamily: "Poppins",
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      height: size.height / 20,
                      width: size.width - 80,
                      child: Text(
                        tanggalDB,
                        style: const TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFC4C4C4)),
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                  bottom: 0,
                  child: SvgPicture.asset("assets/svg/wavebottomsvg.svg"))
            ],
          ),
        ),
      ),
    );
  }
}
