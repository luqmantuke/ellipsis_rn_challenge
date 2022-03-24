import 'package:flutter/material.dart';

bool isLoading = false;
Container elevatedButtonMethod(Size size, BuildContext context, String name,
    void Function()? myonPressed) {
  return Container(
    height: size.height * 0.05,
    width: size.width / 0.5,
    padding: const EdgeInsets.only(left: 20, right: 20),
    child: ElevatedButton(
      onPressed: myonPressed,
      child: Text(
        name,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
            // ignore: deprecated_member_use
            Theme.of(context).accentColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    ),
  );
}
