import 'package:flutter/material.dart';
import 'package:i_lab/Screens/Login/components/text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        style: const TextStyle(fontSize: 12, fontFamily: "Poppins"),
        decoration: const InputDecoration(
          icon: Icon(
            Icons.person,
            color: Colors.grey,
            size: 24,
          ),
          labelText: "Username",
          labelStyle: TextStyle(
            fontFamily: "Poppins",
            color: Colors.grey,
            fontSize: 14,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
