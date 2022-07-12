import 'package:flutter/material.dart';
import 'package:i_lab/Screens/Cart/cart_page.dart';
import 'package:i_lab/Screens/paymentMethod/components/BcaPayment.dart';
import 'package:i_lab/constants.dart';

class BodyPayment extends StatelessWidget {
  const BodyPayment({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
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
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CartPage()));
                  },
                ),
              ),
              title: Container(
                margin: const EdgeInsets.only(bottom: 9),
                height: 66,
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Payment",
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      margin: const EdgeInsets.only(
                        top: 25,
                      ),
                      height: size.height / 13,
                      width: size.width - 41,
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const BcaPayment()));
                        },
                        style: OutlinedButton.styleFrom(
                            alignment: Alignment.centerLeft,
                            splashFactory: NoSplash.splashFactory,
                            primary: Colors.transparent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: size.height / 13,
                              width: size.width / 6,
                              child: Image.asset("assets/images/bca_icon.png"),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 20),
                              child: const Text(
                                "Bank Central Asia",
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: const EdgeInsets.only(
                        top: 10,
                      ),
                      height: size.height / 13,
                      width: size.width - 41,
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                            alignment: Alignment.centerLeft,
                            splashFactory: NoSplash.splashFactory,
                            primary: Colors.transparent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: size.height / 13,
                              width: size.width / 5,
                              child:
                                  Image.asset("assets/images/mandiri_icon.png"),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 7),
                              child: const Text(
                                "Bank Mandiri",
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: const EdgeInsets.only(top: 10),
                      height: size.height / 13,
                      width: size.width - 41,
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                            alignment: Alignment.centerLeft,
                            splashFactory: NoSplash.splashFactory,
                            primary: Colors.transparent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: size.height / 13,
                              width: size.width / 7,
                              child: Image.asset("assets/images/bni_icon.png"),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 29),
                              child: const Text(
                                "Bank Negara Indonesia",
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: const EdgeInsets.only(top: 10),
                      height: size.height / 13,
                      width: size.width - 41,
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                            alignment: Alignment.centerLeft,
                            splashFactory: NoSplash.splashFactory,
                            primary: Colors.transparent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: size.height / 13,
                              width: size.width / 6,
                              child: Image.asset("assets/images/bri_icon.png"),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 20),
                              child: const Text(
                                "Bank Rakyat Indonesia",
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
