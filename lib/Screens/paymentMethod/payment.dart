import 'package:flutter/material.dart';
import 'components/BodyPayment.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BodyPayment(size: size);
  }
}
