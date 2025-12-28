

import 'package:btcar_1/constant.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CustumeTextField extends StatefulWidget {

  CustumeTextField({ this.textInputType, this.textEditingController, this.enable=true, this.hint,this.onchange,required  this.validetor,required this.ispass,this.labelText});
  String? hint;
  String? labelText;
  Function(String)? onchange;
  final String? Function(dynamic value) validetor;
   bool ispass=true;
   bool? enable;
   TextEditingController? textEditingController;
   TextInputType? textInputType;



  @override
  State<CustumeTextField> createState() => _CustumeTextFieldState();
}

class _CustumeTextFieldState extends State<CustumeTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
          validator: (v) => widget.validetor(v),
        onChanged:widget.onchange ,
        keyboardType: widget.textInputType,
        controller: widget.textEditingController,
        decoration: InputDecoration(
          suffixIcon:widget.ispass?IconButton(icon: Icon(Icons.visibility_off),onPressed: (){

            setState(() {});
          }):null,
            enabled: widget.enable!,
            hintText: widget.hint,
            labelText: widget.labelText,
            labelStyle: TextStyle(
                color: kprimaryColor
            ),
            hintStyle: TextStyle(
                color: Colors.orangeAccent
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: kprimaryColor
              ),
              borderRadius: BorderRadius.circular(6),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                  color: kprimaryColor
              ),
              borderRadius: BorderRadius.circular(6),
            ),
            disabledBorder:OutlineInputBorder(
              borderSide: BorderSide(
                  color: kprimaryColor
              ),
              borderRadius: BorderRadius.circular(6),
            ) ,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: kprimaryColor
              ),
              borderRadius: BorderRadius.circular(6),
            ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(
              style: BorderStyle.solid,
              color: Colors.red,
            )
          )
        ),
      ),
    );
  }
}