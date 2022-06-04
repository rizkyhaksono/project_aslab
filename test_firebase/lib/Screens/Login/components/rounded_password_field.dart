import 'package:flutter/material.dart';
import 'package:test_firebase/Screens/Login/components/text_field_container.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> diUbah;
  const RoundedPasswordField({
    Key? key,
    required this.diUbah,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: TextFormField(
      onChanged: diUbah,
      obscureText: true,
      style: const TextStyle(fontFamily: "Poppins", fontSize: 12),
      decoration: const InputDecoration(
          labelText: "Password",
          labelStyle: TextStyle(
            fontFamily: "Poppins",
            fontSize: 14,
            color: Colors.grey,
          ),
          icon: Icon(
            Icons.lock,
            color: Colors.grey,
            size: 24.0,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: Colors.grey,
            size: 24.0,
          ),
          border: InputBorder.none),
    ));
  }
}
