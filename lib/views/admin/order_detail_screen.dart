import 'package:btcar_1/constant.dart';
import 'package:btcar_1/model/order_model.dart';
import 'package:btcar_1/widgets/appBar.dart';
import 'package:flutter/material.dart';

class OrderDetailScreen extends StatelessWidget {

  OrderDetailScreen({super.key,required this.orderModel});
  OrderModel orderModel;

  // OrderModel orderModel = OrderModel(
  //   phone: '0123456789',
  //   id: 'id',
  //   username: 'Username',
  //   category: 'Services',
  //   processname: 'subscription',
  //   processDiscription: 'It is a cable that is connected to a dead battery and a full battery temporarily to fill the empty battery',
  //   price: '30',
  //   long: 'long 13.6',
  //   lat: 'lat  177.8',
  //   image: 'assets/images/Tires/car1.png',
  //   paymethod: 'viza',
  // );

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar('Order Detail', context),
      body: Column(
        // physics: const BouncingScrollPhysics(),
        children: [
          SizedBox(height: 2),
          Hero(
            tag: orderModel.image,
            child: Image.asset(
              orderModel.image!,
              height: size.height*.2,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 20),
          Text(
            orderModel.username,
            style: TextStyle(
              fontSize: 25,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 20),
          Spacer(),
          Container(
            height: size.height*.6,
            decoration: BoxDecoration(
              color: kprimaryColor,
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            orderModel.processname,
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Image.asset("assets/images/star.png"),
                        ],
                      ),
                      Text(
                        "${orderModel.price}.SR",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Divider(thickness: 2,color: ksecondaryColor,),
                      const SizedBox(height: 10),
                      Text(
                        "Description",
                        style: TextStyle(
                          fontSize: 19,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        orderModel.processDiscription,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Divider(thickness: 2,color: ksecondaryColor,),
                      const SizedBox(height: 10),
                      Text(
                        "Location",
                        style: TextStyle(
                          fontSize: 19,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '${orderModel.long}  ${orderModel.lat}',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Divider(thickness: 2,color: ksecondaryColor,),
                      const SizedBox(height: 10),
                      Text(
                        "Paymant Method",
                        style: TextStyle(
                          fontSize: 19,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '${orderModel.paymethod}',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Divider(thickness: 2,color: ksecondaryColor,),
                      const SizedBox(height: 10),
                      Text(
                        "Phone",
                        style: TextStyle(
                          fontSize: 19,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '${orderModel.phone}',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Divider(thickness: 2,color: ksecondaryColor,),
                      //Spacer(flex: 1,),
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
