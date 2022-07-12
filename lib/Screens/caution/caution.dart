import 'package:flutter/material.dart';
import 'package:i_lab/Screens/Dashboard/main_dashboard.dart';
import 'package:i_lab/constants.dart';

class Caution extends StatefulWidget {
  const Caution({Key? key}) : super(key: key);

  @override
  State<Caution> createState() => _CautionState();
}

class _CautionState extends State<Caution> {
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
                          builder: (context) => const MainDashboard()));
                },
              ),
            ),
            title: Container(
              margin: const EdgeInsets.only(bottom: 9),
              height: 66,
              alignment: Alignment.centerLeft,
              child: const Text("Pembelian Barang"),
            ),
          ),
        ),
      ),
      child: SafeArea(
          top: true,
          child: Scaffold(
            appBar: AppBar(),
          )),
    );
  }
}
