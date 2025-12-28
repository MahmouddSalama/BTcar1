

import 'package:btcar_1/constant.dart';
import 'package:flutter/material.dart';

class AuthHead extends StatelessWidget {
  AuthHead({super.key,required this.name});
  String name;
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        const SizedBox(
          height: 75,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            "assets/images/intro/bt1.png",
            height: 100,
          ),
        ),
        SizedBox(height: 20),
        const Align(
          alignment: Alignment.center,
          child: Text(
            "BTCar",
            style: TextStyle(
                fontSize: 32, fontFamily: "Pacifico", color: kprimaryColor),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            name,
            style: const TextStyle(fontSize: 18, color: kprimaryColor),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}