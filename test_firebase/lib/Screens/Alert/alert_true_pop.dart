import 'package:flutter/material.dart';
import 'package:test_firebase/Screens/Cart/cart_page.dart';
import 'package:test_firebase/Screens/Dashboard/main_dashboard.dart';

class AlertTruePop extends StatefulWidget {
  const AlertTruePop({Key? key}) : super(key: key);

  @override
  State<AlertTruePop> createState() => _AlertTruePopState();
}

class _AlertTruePopState extends State<AlertTruePop> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Terima kasih sudah berbelanja di I-Lab'),
      content: const Text('Dimohon menunggu pesanan.'),
      actions: <Widget>[
        TextButton(
          child: const Text('Baik'),
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const MainDashboard()));
          },
        ),
      ],
    );
  }
}
