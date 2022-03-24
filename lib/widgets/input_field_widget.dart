import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InputFieldWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  void Function(String)? onChanged;
  bool obscureText = false;
  TextInputType? keyboardType;
  Widget? icon;
  Function(String?)? onSaved;
  InputFieldWidget({
    Key? key,
    required this.hintText,
    required this.controller,
    this.onChanged,
    required this.obscureText,
    this.keyboardType,
    this.icon,
    this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: TextFormField(
        keyboardType: keyboardType,
        controller: controller,
        onChanged: onChanged,
        onSaved: onSaved,
        obscureText: obscureText,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
          color: Colors.teal,
        ),
        decoration: InputDecoration(
          suffixIcon: icon,
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 14,
            fontStyle: FontStyle.normal,
            color: Color(0xffABABAB),
          ),
          labelStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
