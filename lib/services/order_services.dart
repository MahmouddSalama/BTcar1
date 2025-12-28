import 'package:btcar_1/functions/snach_function.dart';
import 'package:btcar_1/model/order_model.dart';
import 'package:btcar_1/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OrderServices{
  static Future<void> addOrder({ required OrderModel orderModel,required ctx})async {
    try{
      final User? auth = FirebaseAuth.instance.currentUser;
      QuerySnapshot<Map<String, dynamic>> user= await FirebaseFirestore.instance.collection("users").where('id',isEqualTo: auth!.uid).get();
      UserModel userModel=UserModel.fromJson(user.docs[0]);
      await FirebaseFirestore.instance.collection("orders")
          .add(
          {
            'phone':userModel.phone,
            'username': userModel.name,
            "id":auth!.uid,
            'paymethod':orderModel.paymethod,
            'lat':orderModel.lat,
            'long':orderModel.long,
            'processDiscription':orderModel.processDiscription,
            'image':orderModel.image,
            'processname':orderModel.processname,
            'category':orderModel.category,
            'price':orderModel.price
          }
      );
    }catch(e){
      showSnackBar(ctx, e.toString());
    }
  }
}