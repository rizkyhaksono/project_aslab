import 'package:flutter/material.dart';

class Caution extends StatefulWidget {
  const Caution({Key? key}) : super(key: key);

  @override
  State<Caution> createState() => _CautionState();
}

class _CautionState extends State<Caution> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
          top: true,
          child: Scaffold(
            appBar: AppBar(),
          )),
    );
  }
}
