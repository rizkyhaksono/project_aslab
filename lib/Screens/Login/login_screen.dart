import 'package:flutter/material.dart';

import 'login_page_state.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginPageState(),
      // body: CartScreen(),
    );
  }
}
