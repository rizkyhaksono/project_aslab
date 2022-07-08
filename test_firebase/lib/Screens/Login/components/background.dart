// ignore_for_file: file_names

import 'package:flutter/material.dart';

class BackgroundLogin extends StatelessWidget {
  final Widget child;
  const BackgroundLogin({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(bottom: 450),
            margin: const EdgeInsets.symmetric(vertical: 10),
            width: size.width * 0.5,
            child: Positioned(
              top: 70,
              child: Image.asset("assets/images/logolabitnoback.png"),
              width: size.width * 0.5,
            ),
          ),
          Positioned(
              bottom: 0,
              child: Image.asset("assets/images/iconwavebottom.png")),
          child,
        ],
      ),
    );
  }
}
