
import 'package:btcar_1/constant.dart';
import 'package:flutter/material.dart';

class RegisterRow extends StatelessWidget {
  RegisterRow({
    required this.text,
    required this.screen,
    super.key,
  });

  String text;
  Widget screen;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "don't have an account ?",
          style: TextStyle(
            color: kprimaryColor,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
                  return screen;
                }));
          },
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.orangeAccent,
            ),
          ),
        )
      ],
    );
  }
}