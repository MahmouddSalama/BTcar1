import 'package:btcar_1/model/vehicle.dart';
import 'package:btcar_1/views/user/types.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ElevatedButton buildBox({Color? color, String? text, VoidCallback? press}) {
      return ElevatedButton(
          onPressed: press,
          style: ElevatedButton.styleFrom(
              primary: color,
              fixedSize: Size(39.w, 20.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              )),
          child: Text(
            text!,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20.0,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ));
    }
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildBox(
                  color: const Color(0xFFF19A36),
                  text: "Tires",
                  press: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Types(itemName: "Tires", items: getBigCars)))),
              buildBox(
                  color: const Color(0xFFF19A36),
                  text: "Batteries",
                  press: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Types(itemName: "Batteries", items: getBikes)))),
            ],
          ),
        ],
      ),
    );
  }
}
