import 'package:flutter/material.dart';
import 'package:test_firebase/Screens/BuktiTransfer/buktiTF_body.dart';
import 'package:test_firebase/Screens/Cart/cart_page.dart';
import 'package:test_firebase/constants.dart';

import '../payment.dart';

class MandiriPayment extends StatefulWidget {
  const MandiriPayment({Key? key}) : super(key: key);

  @override
  State<MandiriPayment> createState() => _MandiriPaymentState();
}

var rekeningTujuan = "3456 2314 01";

class _MandiriPaymentState extends State<MandiriPayment> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: backgroundcolor,
      child: SafeArea(
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
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const Payment()));
              },
            ),
          ),
          title: Container(
            margin: const EdgeInsets.only(bottom: 9),
            height: 66,
            alignment: Alignment.centerLeft,
            child: const Text(
              "Bank Mandiri",
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
          height: size.height,
          width: size.width,
          color: Colors.white,
          child: Column(children: [
            Container(
                margin: const EdgeInsets.symmetric(vertical: 25),
                height: size.height / 10,
                width: size.width - 41,
                decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFFC4C4C4)),
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: size.height / 13,
                      width: size.width / 6,
                      child: Image.asset("assets/images/mandiri_icon.png"),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20),
                      alignment: Alignment.centerLeft,
                      height: size.height / 19,
                      width: size.width / 2,
                      decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Color(0xFFC4C4C4))),
                      ),
                      child: Text(
                        "No. Rekening Tujuan \nMandiri - $rekeningTujuan",
                        style: const TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                )),
            Container(
                height: size.height / 17,
                width: size.width - 41,
                decoration: const BoxDecoration(
                    border:
                        Border(bottom: BorderSide(color: Color(0xFFC4C4C4)))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        alignment: Alignment.centerLeft,
                        height: size.height / 17,
                        width: size.width / 3,
                        child: const Text(
                          "Sub Total",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Montserrat",
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    Container(
                      alignment: Alignment.centerRight,
                      height: size.height / 17,
                      width: size.width / 3,
                      child: Text(
                        "Rp.$HargaJaket",
                        style: const TextStyle(
                            color: Colors.black,
                            fontFamily: "Montserrat",
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                )),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UploadImageScreen()));
                  },
                  child: const Text(
                    "Konfirmasi",
                    style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => states.any(
                                  (element) => element == MaterialState.pressed)
                              ? kPrimaryDarkColor
                              : kPrimaryColor),
                      minimumSize:
                          MaterialStateProperty.all(const Size(206, 43)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))))),
            )
          ]),
        ),
      )),
    );
  }
}
