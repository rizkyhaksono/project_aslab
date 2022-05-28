import 'package:flutter/material.dart';
import 'package:i_lab/Screens/Cart/cart_screen.dart';
import 'components/body.dart';
import 'login_page_state.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: const LoginPageState(),
      body: LoginPageState(),
    );
  }
}
