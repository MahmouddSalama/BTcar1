import 'package:flutter/material.dart';

class PaymentModel{
  final IconData iconData;
  final String name;

  PaymentModel({required this.iconData, required this.name});

}
List<PaymentModel> payMethods=[
  PaymentModel(iconData: Icons.money, name: 'Pay with'),
  PaymentModel(iconData: Icons.account_balance_wallet, name: 'cash'),
  PaymentModel(iconData: IconData(0xe19f, fontFamily: 'MaterialIcons'), name: 'card'),
  PaymentModel(iconData: Icons.account_balance, name: 'Banking'),
];