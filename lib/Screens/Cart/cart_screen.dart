import 'package:flutter/material.dart';

import 'package:i_lab/Screens/Cart/Cart.dart';
import 'package:i_lab/Screens/Cart/body_cart.dart';
import 'package:i_lab/Screens/Login/login_page_state.dart';
import 'package:i_lab/constants.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // background color
      backgroundColor: Colors.white,
      appBar: anjayBro(context),
      body: BodyCart(),
    );
  }

  AppBar anjayBro(BuildContext context) {
    return AppBar(
      elevation: 6,
      backgroundColor: kPrimaryDarkColor,
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          // ganti ke main dasboard
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => LoginPageState()));
        },
        icon: const Icon(Icons.arrow_back_outlined),
        color: Colors.white,
      ),
      title: Column(
        children: [
          // title
          const Text(
            "Your Cart",
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Poppins",
              fontSize: 18,
            ),
          ),
          // detail order product
          Text(
            // dummy datas from Cart.dart
            "${demoCarts.length} items",
            style: const TextStyle(
              color: Colors.white,
              fontFamily: "Poppins",
              fontSize: 14,
            ),
          )
        ],
      ),
    );
  }
}
