
import 'package:btcar_1/constant.dart';
import 'package:btcar_1/model/user_model.dart';
import 'package:btcar_1/services/auth_services.dart';
import 'package:btcar_1/widgets/custome_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final  User? auth = FirebaseAuth.instance.currentUser;
    CollectionReference<Map<String, dynamic>> user =
    FirebaseFirestore.instance.collection("users");
    return Scaffold(
      appBar: AppBar(

        elevation: 0,
        centerTitle: true,
        title: const Text(
          "User Name",
          style: TextStyle(
              fontSize: 22, fontFamily: "Pacifico", color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: SingleChildScrollView(
          child: StreamBuilder<QuerySnapshot>(
            stream: user.where('id',isEqualTo:auth!.uid ).snapshots(),
            builder: (context, snapshot) {
             if(snapshot.hasData){
               UserModel userModel=UserModel.fromJson(snapshot.data!.docs[0]);
               return Column(
                 children: [
                   SizedBox(height: 50),
                   CircleAvatar(
                     backgroundColor: kprimaryColor,
                     radius: 60,
                     child: Image.asset(
                       "assets/images/intro/bt1.png",
                       fit: BoxFit.fill,
                     ),
                   ),
                   SizedBox(
                     height: 30,
                   ),
                   Text(
                     "Name : ${userModel.name}",
                     style: TextStyle(fontSize: 18),
                   ),
                   SizedBox(
                     height: 10,
                   ),
                   Align(
                     alignment: Alignment.centerLeft,
                     child: Text(
                       "INFO",
                       style: TextStyle(
                           color: kprimaryColor,
                           fontSize: 20,
                           fontWeight: FontWeight.bold),
                     ),
                   ),
                   Divider(
                     color: kprimaryColor,
                     thickness: 1.2,
                   ),
                   buildColumn(text: "Name : ${userModel.name}", icon: Icons.person),
                   buildColumn(text: "Age : ${userModel.age}", icon: Icons.person),
                   buildColumn(text: "Email : ${userModel.email}", icon: Icons.email),
                   buildColumn(text: "Admin : ${userModel.admin}", icon: Icons.pregnant_woman_rounded),
                   buildColumn(text: "phone : ${userModel.phone}", icon: Icons.phone),
                   SizedBox(height: 20),
                   CustomButton(function: (){
                     Auth.logOut(context);
                   }, text: 'logOut')
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
          ),
        ),
      ),
    );
  }

  Column buildColumn({text, icon}) {
    return Column(
      children: [
        ListTile(
          title: Text(text),
          leading: Icon(
            icon,
            color: kprimaryColor,
          ),
        ),
        Divider(
          color: kprimaryColor,
          thickness: 1.2,
        )
      ],
    );
  }
}
