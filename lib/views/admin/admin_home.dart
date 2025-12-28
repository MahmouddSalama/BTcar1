import 'package:btcar_1/constant.dart';
import 'package:btcar_1/model/order_model.dart';
import 'package:btcar_1/views/admin/order_detail_screen.dart';
import 'package:btcar_1/widgets/appBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class AdminHome extends StatelessWidget {
   AdminHome({super.key});

   List<OrderModel> ordersList=[];
  @override
  Widget build(BuildContext context) {
    final  User? auth = FirebaseAuth.instance.currentUser;
    CollectionReference<Map<String, dynamic>> data =
    FirebaseFirestore.instance.collection("orders");
    return Scaffold(
      appBar: appBar('Admin', context),
      body: StreamBuilder<QuerySnapshot>(
        stream: data.snapshots(),
        builder: (context, snapshot) {
          ordersList=[];
         if(snapshot.hasData){
           for (int i=0;i<snapshot.data!.docs.length;i++){
             ordersList.add(OrderModel.fromjson(snapshot.data!.docs[i]));
           }
           return ListView.builder(
             itemCount: ordersList.length,
             itemBuilder: (context,i){
               return Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 10),
                 child: Column(
                   children: [
                     ListTile(
                       onTap: (){
                         // go to order card
                         Navigator.push(
                             context,
                             MaterialPageRoute(
                                 builder: (context) =>  OrderDetailScreen(orderModel: ordersList[i],)));
                       },
                       title: Text('${ordersList[i].category}'),
                       subtitle: Text('${ordersList[i].username}'),
                       trailing: Icon(Icons.arrow_forward_ios_outlined),
                       leading: CircleAvatar(
                         backgroundColor: kprimaryColor,
                         radius: 25,
                         child: Image.asset("${ordersList[i].image}",fit: BoxFit.fill,),
                       ),
                     ),
                     Divider(thickness: 2,color: kprimaryColor)
                   ],
                 ),
               );
             },
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
    );
  }
}