import 'package:flutter/material.dart';
import 'package:test_firebase/Screens/Welcome/components/Background.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 130),
            child: const Text(
              "Lab Informatika UMM",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
