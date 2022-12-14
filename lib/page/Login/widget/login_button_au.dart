import 'package:flutter/material.dart';

class LoginButt extends StatelessWidget {
  final String title;
  final Function() onPressed;

  const LoginButt({
    Key key,
    this.title,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(36),
          ),
        ),
        backgroundColor:
            MaterialStateProperty.all<Color>(const Color(0xFF417D86)),
        fixedSize: MaterialStateProperty.all<Size>(const Size(360, 100)),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 70,
          fontWeight: FontWeight.w300,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
