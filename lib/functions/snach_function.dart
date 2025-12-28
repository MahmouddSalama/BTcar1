
import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(ctx,
    String error) {
  return ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
    content: Text(error, style: const TextStyle(
        color: Colors.white
    ),),
  ));
}