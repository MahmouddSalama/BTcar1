import 'package:btcar_1/constant.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
   CustomButton({
    required this.function,
     required this.text,
    super.key,
  });

  VoidCallback function;
  String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        width: 250,
        height: 60,
        decoration: BoxDecoration(
            color: kprimaryColor,
            borderRadius: BorderRadius.circular(5)
        ),
        child:  Center(child: Text(text,style: const TextStyle(
          color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 21

        ),)),
      ),
    );
  }
}