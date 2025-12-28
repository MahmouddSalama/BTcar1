import 'package:btcar_1/constant.dart';
import 'package:btcar_1/model/user_model.dart';
import 'package:btcar_1/views/admin/admin_home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';


import '../user/home.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int _currentPage = 0;
  PageController _pageController = PageController(initialPage: 0);

  List<Map<dynamic, dynamic>> data = [
    {
      "text": "Get help with us",
      "subText": "Repair your car within 45 minutes",
      "imgUrl": "assets/images/intro/bt1.png",
      "buttonText": "Continue",
    },
    {
      "text": "Maintain your battery",
      "subText": "Under the hands of a professional worker",
      "imgUrl": "assets/images/intro/bt2.png",
      "buttonText": "Continue",
    },
    {
      "text": "Solve tire problems",
      "subText": "Speed and accuracy of installation",
      "imgUrl": "assets/images/intro/bt3.png",
      "buttonText": "Continue",
    },
    {
      "text": "Select your location",
      "subText": "Contact us to help you",
      "imgUrl": "assets/images/intro/intro4.png",
      "buttonText": "Get Started",
    }
  ];

  AnimatedContainer buildIndicator({int? index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.symmetric(horizontal: 6.0),
      height: 7.0,
      width: 25.0,
      decoration: BoxDecoration(
        color: _currentPage == index ? kprimaryColor : ksecondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final  User? auth = FirebaseAuth.instance.currentUser;
    CollectionReference<Map<String, dynamic>> user =
    FirebaseFirestore.instance.collection("users");
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        // For Android
        // use (light) for white status bar and (dark) for black status bar
        statusBarIconBrightness: Brightness.dark,
        // For IOS
        // use (dark) for white status bar and (light) for black status bar
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: SafeArea(
            child: StreamBuilder<QuerySnapshot>(
              stream: user.where('id',isEqualTo: auth!.uid).snapshots(),
              builder: (context, snapshot) {
               if(snapshot.hasData){
                 UserModel userModel=UserModel.fromJson(snapshot.data!.docs[0]);
                 return ListView(
                   shrinkWrap: true,
                   physics: const BouncingScrollPhysics(),
                   children: [
                     SizedBox(height: 3.0.h),
                     Center(
                       child: Text(
                         "Welcome",
                         style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
                       ),
                     ),
                     SizedBox(height: 8.0.h),
                     SizedBox(
                       height: 40.h,
                       child: PageView.builder(
                         controller: _pageController,
                         itemCount: data.length,
                         onPageChanged: (page) {
                           setState(() {
                             _currentPage = page;
                           });
                         },
                         itemBuilder: (_, index) {
                           return Image.asset(data[index]['imgUrl']);
                         },
                       ),
                     ),
                     SizedBox(height: 4.0.h),
                     SizedBox(
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: List.generate(
                             data.length, (index) => buildIndicator(index: index)),
                       ),
                     ),
                     Padding(
                       padding:
                       EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 5.0.h),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.stretch,
                         children: [
                           Text(
                             data[_currentPage]["text"],
                             textAlign: TextAlign.center,
                             style: TextStyle(
                               fontSize: 20.0.sp,
                               fontWeight: FontWeight.w600,
                             ),
                           ),
                           SizedBox(height: 2.0.h),
                           Text(
                             data[_currentPage]["subText"],
                             textAlign: TextAlign.center,
                             style: TextStyle(
                               fontSize: 13.0.sp,
                               fontWeight: FontWeight.w400,
                             ),
                           ),
                           SizedBox(height: 8.0.h),
                           TextButton(
                             onPressed: () {

                               if(userModel.admin){
                                 Navigator.push(
                                     context,
                                     MaterialPageRoute(
                                         builder: (context) =>  AdminHome()));
                               }
                               else
                               Navigator.push(
                                   context,
                                   MaterialPageRoute(
                                       builder: (context) =>  Home()));
                             },
                             style: TextButton.styleFrom(
                               primary: Colors.white,
                               fixedSize: Size(double.infinity, 7.5.h),
                             ),
                             child: Text(
                               data[_currentPage]["buttonText"],
                               textAlign: TextAlign.center,
                               style: TextStyle(
                                 fontSize: 14.0.sp,
                                 fontWeight: FontWeight.w600,
                               ),
                             ),
                           )
                         ],
                       ),
                     )
                   ],
                 );
               }
               else{
                 return Center(
                   child: CircularProgressIndicator(
                     color: kprimaryColor,
                   ),
                 );
               }
              }
            )),
      ),
    );
  }
}
