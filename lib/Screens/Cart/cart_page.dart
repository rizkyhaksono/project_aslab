import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:i_lab/Screens/Dashboard/main_dashboard.dart';
import 'package:i_lab/Screens/Login/login_page_state.dart';
import 'package:i_lab/constants.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double getHeight(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final EdgeInsets padding = MediaQuery.of(context).padding;
    return height - padding.bottom;
  }

  List<String> items = ['S', 'M', 'XL', 'XXL'];
  String? selectedItem = 'S';

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
                margin: const EdgeInsets.only(bottom: 9),
                height: 66,
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.push(
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
                  "Payment",
                  style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 16,
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
                          height: 225,
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
                          margin: const EdgeInsets.only(top: 10, left: 20),
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
                          margin: const EdgeInsets.only(top: 10, left: 20),
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
                          padding: const EdgeInsets.only(left: 20),
                          alignment: Alignment.centerLeft,
                          height: 41,
                          width: size.width - 41,
                          decoration: BoxDecoration(
                              color: const Color(0xFFE2E8F0),
                              borderRadius: BorderRadius.circular(8)),
                          child: Text(fullNameUser),
                        )),
                        Container(
                          margin: const EdgeInsets.only(top: 20, left: 20),
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
                            padding: const EdgeInsets.only(left: 20),
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
                          margin: const EdgeInsets.only(top: 20, left: 20),
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
                                onChanged: (item) =>
                                    setState(() => selectedItem = item),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                        bottom: 0,
                        child: SvgPicture.asset("assets/svg/wavebottomsvg.svg"))
                  ],
                ))),
      ),
    );
  }
}
