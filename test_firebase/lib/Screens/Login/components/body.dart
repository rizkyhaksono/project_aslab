import 'package:flutter/material.dart';
import 'package:test_firebase/Screens/Login/components/background.dart';

import '../login_page_state.dart';
import 'login_button_field.dart';

class BodyLogin extends StatelessWidget {
  const BodyLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundLogin(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 200),
            child: const Text(
              "Sign In",
              style: TextStyle(
                  fontFamily: "Montserrat",
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
          LoginPageState(),
        ],
      ),
    );
  }
}
