// ignore_for_file: file_names

import 'package:btcar_1/views/auth_screens/login.dart';
import 'package:btcar_1/views/shared/profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

appBar(String? itemName, BuildContext context) {
  return AppBar(
    title: Text(
      itemName!,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
    leading: IconButton(
      onPressed: () => Navigator.pop(context),
      icon: const Icon(Icons.chevron_left_rounded),
    ),
    actions:  [
      Padding(
        padding: EdgeInsets.only(right: 10.0),
        child: GestureDetector(
          onTap: (){
            FirebaseAuth.instance
                .authStateChanges()
                .listen((User? user) {
              if (user == null) {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                  return LoginPage();
                }));
              } else {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                  return ProfileScreen();
                }));
              }
            });

          },
          child: CircleAvatar(
            backgroundImage: AssetImage("assets/images/bt_avatar.png"),
          ),
        ),
      ),
    ],
  );
}