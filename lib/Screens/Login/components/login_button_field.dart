import 'package:flutter/material.dart';
import '../../../constants.dart';

class LoginButton extends StatefulWidget {
  LoginButton({Key? key}) : super(key: key);

  @override
  _LoginButtonState createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: kPrimaryColor,
          shadowColor: Colors.black,
          minimumSize: const Size(100, 38),
          alignment: Alignment.center,
          animationDuration: const Duration(milliseconds: 200),
          elevation: 5,
          shape: const StadiumBorder(),
        ),
        onPressed: () {},
        child: const Text(
          "LOGIN",
          style: TextStyle(
              color: Colors.white,
              fontFamily: "Montserrat",
              fontWeight: FontWeight.bold,
              fontSize: 14),
        ));
  }
}
