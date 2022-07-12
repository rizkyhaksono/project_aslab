// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        children: const <Widget>[],
      ),
    );
  }
}

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: double.infinity,
      child: Stack(alignment: Alignment.center, children: <Widget>[
        Positioned(
            bottom: 0, child: Image.asset("assets/images/iconwavebottom.png")),
        Positioned(
          top: 235,
          width: size.width * 0.6,
          child: Image.asset("assets/images/logolabitnoback.png"),
        ),
        Positioned(top: 0, child: Image.asset("assets/images/wavetop.png")),
        child,
      ]),
    );
  }
}
