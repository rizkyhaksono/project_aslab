import 'package:flutter/material.dart';
import 'package:test_firebase/Screens/Cart/cart_page.dart';

class AlertFalsePop extends StatefulWidget {
  const AlertFalsePop({Key? key}) : super(key: key);

  @override
  State<AlertFalsePop> createState() => _AlertFalsePopState();
}

class _AlertFalsePopState extends State<AlertFalsePop> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Peringatan'),
      content:
          const Text('Ukuran masih kosong! Silahkan lengkapi terlebih dahulu.'),
      actions: <Widget>[
        TextButton(
          child: const Text('Ya'),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop(context);
            // Navigator.pushReplacement(context,
            //     MaterialPageRoute(builder: (context) => const CartPage()));
          },
        ),
      ],
    );
  }
}
