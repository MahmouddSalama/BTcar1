import 'package:btcar_1/model/vehicle.dart';
import 'package:btcar_1/views/user/order_screen.dart';
import 'package:btcar_1/widgets/appBar.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


class Detail extends StatelessWidget {
  final Vehicle vehicle;
  final String itemName;
  // final String? name;
  // final int? price;
  // final String? image;
  // final Color? color;
  // final String? description;

  const Detail(
      {Key? key,
        required this.itemName,
        required this.vehicle,
      // this.name,
      // this.price,
      // this.image,
      // this.color,
      // this.description
  })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(vehicle.name, context),
      body: Column(
        // physics: const BouncingScrollPhysics(),
        children: [
          SizedBox(height: 2.h),
          Hero(
            tag: vehicle.url!,
            child: Image.asset(
              vehicle.url!,
              height: 40.h,
              fit: BoxFit.contain,
            ),
          ),
          const Spacer(),
          Container(
            decoration: BoxDecoration(
              color: vehicle.cardColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                    vehicle.name!,
                            style: TextStyle(
                              fontSize: 25.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Image.asset("assets/images/star.png"),
                        ],
                      ),
                      Text(
                        "${vehicle.price}.SR",
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 38.0),
                      Text(
                        "Description",
                        style: TextStyle(
                          fontSize: 19.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        vehicle.description!,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 38.0),
                      TextButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                                  return OrderScreen(vehicle: vehicle,itemName: itemName,);
                                }));
                          },
                          style: TextButton.styleFrom(
                            fixedSize: Size(double.infinity, 8.0.h),
                            primary: Colors.black,
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: Text(
                            "Order Now",
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ))
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
