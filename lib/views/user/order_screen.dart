

import 'dart:async';

import 'package:btcar_1/constant.dart';
import 'package:btcar_1/model/order_model.dart';
import 'package:btcar_1/model/payment_model.dart';
import 'package:btcar_1/model/vehicle.dart';
import 'package:btcar_1/services/order_services.dart';
import 'package:btcar_1/widgets/custome_button.dart';
import 'package:btcar_1/widgets/custome_text_filed.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrderScreen extends StatefulWidget {
  final Vehicle vehicle;
  final String itemName;

  OrderScreen({ required this.vehicle,required  this.itemName, }) ;

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  Completer<GoogleMapController> _controller = Completer();
  TextEditingController loaction = TextEditingController();

// on below line we have specified camera position
  static final CameraPosition _kGoogle = const CameraPosition(
    target: LatLng(20.42796133580664, 80.885749655962),
    zoom: 14.4746,
  );

// on below line we have created the list of markers
  final List<Marker> _markers = <Marker>[
    Marker(
        markerId: MarkerId('1'),
        position: LatLng(20.42796133580664, 75.885749655962),
        infoWindow: InfoWindow(
          title: 'My Position',
        )),
  ];

// created method for getting user current location
  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) async {
      await Geolocator.requestPermission();
      print("ERROR" + error.toString());
    });
    return await Geolocator.getCurrentPosition();
  }

  String selectedValue = 'Pay with';
  String? long,lat;
  bool load=false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        // on below line we have given title of app
        title: Text(
          "Order",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CustumeTextField(
              textEditingController: loaction,
              enable: false,
              validetor: (v) {},
              ispass: false,
              onchange: (b) {},
              labelText: 'Location',
              hint: 'lang : 12.5 lat 188.9',
            ),
          ),
          Stack(
            children: [
              Container(
                height: size.height * .6,
                child: SafeArea(
                  // on below line creating google maps
                  child: GoogleMap(
                    // on below line setting camera position
                    initialCameraPosition: _kGoogle,
                    // on below line we are setting markers on the map
                    markers: _markers.toSet(),
                    // on below line specifying map type.
                    mapType: MapType.normal,
                    // on below line setting user location enabled.
                    myLocationEnabled: true,
                    // on below line setting compass enabled.
                    compassEnabled: true,
                    // on below line specifying controller on map complete.
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: FloatingActionButton(
                  onPressed: () async {
                    getUserCurrentLocation().then((value) async {
                      lat=value.altitude.toString();
                      long=value.longitude.toString();
                      print(value.latitude.toString() +
                          " " +
                          value.longitude.toString());
                      loaction.text = 'lang  ' +
                          value.latitude.toString() +
                          " lat " +
                          value.longitude.toString();
                      // marker added for current users location
                      _markers.add(Marker(
                        markerId: MarkerId("2"),
                        position: LatLng(value.latitude, value.longitude),
                        infoWindow: InfoWindow(
                          title: 'My Current Location',
                        ),
                      ));

                      // specified current users location
                      CameraPosition cameraPosition = new CameraPosition(
                        target: LatLng(value.latitude, value.longitude),
                        zoom: 16,
                      );

                      final GoogleMapController controller =
                          await _controller.future;
                      controller.animateCamera(
                          CameraUpdate.newCameraPosition(cameraPosition));
                      setState(() {});
                    });
                  },
                  child: Icon(Icons.location_on),
                  backgroundColor: kprimaryColor,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    width: size.width * .5,
                    height: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xffF3F3F3)),
                    child: Center(
                      child: DropdownButton<String>(
                        value: selectedValue,
                        onChanged: (newValue) {
                          setState(() {
                            selectedValue = newValue!;
                          });
                        },
                        items: payMethods.map((PaymentModel value) {
                          return DropdownMenuItem<String>(
                            value: value.name,
                            child: Row(
                              children: [
                                Icon(value.iconData),
                                SizedBox(width: 40),
                                Text(
                                  value.name,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    width: size.width * .5,
                    height: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xffF3F3F3)),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Discount',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 40),
                          Icon(Icons.add),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
         load? Center(child: CircularProgressIndicator(color: kprimaryColor,),): CustomButton(
            text: 'Order',
            function: () {
              OrderModel orderModel = OrderModel(
                phone: 'phone',
                id: 'id',
                username: 'username',
                category: widget.itemName,
                processname: widget.vehicle.name!,
                processDiscription: widget.vehicle.description!,
                price: widget.vehicle.price!.toString(),
                long: long!,
                lat: lat!,
                image: widget.vehicle.url!,
                paymethod: selectedValue,
              );
              addOrder(orderModel: orderModel);

            },
          )
        ],
      ),
      // on pressing floating action button the camera will take to user current location
    );
  }

  void addOrder({required OrderModel orderModel}) async {
    setState(() {
      load=true;
    });
    await OrderServices.addOrder(orderModel: orderModel, ctx:context);
    setState(() {
      load=false;
    });
    Navigator.pop(context);
    Navigator.pop(context);
  }
}
