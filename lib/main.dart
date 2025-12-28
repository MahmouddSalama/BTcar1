import 'package:btcar_1/constant.dart';
import 'package:btcar_1/services/auth_services.dart';
import 'package:btcar_1/views/user/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


import 'firebase_options.dart';
import 'views/shared/onboarding.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp( VehicleApp());
}

class VehicleApp extends StatefulWidget {
   VehicleApp({Key? key}) : super(key: key);

  @override
  State<VehicleApp> createState() => _VehicleAppState();
}

class _VehicleAppState extends State<VehicleApp> {
  bool flag=false;

  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user == null) {
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
        //   return LoginPage();
        // }));
        flag=false;
        setState(() {});
      } else {
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
        //   return HomeScreen();
        // }));
        flag=true;
        setState(() {});
      }
    });
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "BTCar App",
        theme: ThemeData(
          fontFamily: kbalooFont,
          primaryColor: kprimaryColor,
          scaffoldBackgroundColor: Colors.white,
          textTheme: const TextTheme(
            bodyText1: TextStyle(fontFamily: kpoppinsFont),
            bodyText2: TextStyle(fontFamily: kpoppinsFont),
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              primary: Colors.white,
              backgroundColor: kprimaryColor,
            ),
          ),
          appBarTheme: const AppBarTheme(
            elevation: 0,
            centerTitle: true,
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
          ),
        ),
        home: flag? const Onboarding():Home(),
      );
    });
  }
}