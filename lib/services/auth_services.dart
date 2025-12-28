import 'package:btcar_1/functions/snach_function.dart';
import 'package:btcar_1/model/user_model.dart';
import 'package:btcar_1/views/shared/onboarding.dart';
import 'package:btcar_1/views/user/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Auth {
  static Future<void> login(
      {required String email, required String password, required ctx}) async {
    String error = '';
    try {
      print(">>>>>>>>>>>>>>>>>>>enter login function");
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      ).then((value) {
        if(Navigator.canPop(ctx)){
          Navigator.pop(ctx);
        }
        Navigator.pushReplacement(ctx,
            MaterialPageRoute(builder: (ctx) {
              return Home();
            }));
      });
    } on FirebaseAuthException catch (e) {
      showSnackBar(ctx, e.code);
      print(">>>>>>>>>>>>>>>>>>>error");
      if (e.code == 'user-not-found') {
        error = 'No user found for that email.';

        print(error);
      } else if (e.code == 'wrong-password') {
        error = 'Wrong password provided for that user.';
        showSnackBar(ctx, error);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  static Future<void> register(
      {required UserModel userModel, required ctx}) async {
    String error;
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: userModel.email,
        password: userModel.password,
      );
      final User? auth = FirebaseAuth.instance.currentUser;
      await FirebaseFirestore.instance.collection("users")
          .add(
          {
            'name': userModel.name,
            'email': userModel.email,
            'password': userModel.password,
            'phone': userModel.phone,
            'admin':userModel.admin,
            'age':userModel.age,
            'id': auth!.uid,
          }
      );
      Navigator.pushReplacement(ctx,
          MaterialPageRoute(builder: (context) {
            return Home();
          }));

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        error = 'The password provided is too weak.';
        showSnackBar(ctx, error);
      } else if (e.code == 'email-already-in-use') {
        error = 'The account already exists for that email.';
        showSnackBar(ctx, error);
      }
    }
  }

  static Future<void> resetPassword({required email,required ctx}) async {

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: email,
      );
      // Show a success message or navigate to a success screen
      ScaffoldMessenger.of(ctx).showSnackBar(
        SnackBar(
          content: Text(
            'Check your e-mail${email}',
          ),
        ),
      );
    } catch (error) {
      // Handle any errors that occur during password reset
      print('Error sending password reset email: $error');
      ScaffoldMessenger.of(ctx).showSnackBar(
        SnackBar(
          content: Text('Error sending password reset email. Please try again.'),
        ),
      );
    }
  }
  static Future<void> logOut(context) async {
    try {
      await FirebaseAuth.instance.signOut();
      for(;Navigator.canPop(context);)
        Navigator.pop(context);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
        return Home();
      }));
    } catch (e) {
      print('Error logging out: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error logging out. Please try again.'),
        ),
      );
    }
  }

}

