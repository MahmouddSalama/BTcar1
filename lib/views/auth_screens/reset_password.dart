
import 'package:btcar_1/constant.dart';
import 'package:btcar_1/services/auth_services.dart';
import 'package:btcar_1/views/auth_screens/login.dart';
import 'package:btcar_1/widgets/register_row.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../widgets/auth_head.dart';
import '../../widgets/custome_button.dart';
import '../../widgets/custome_text_filed.dart';

class ResetPassword extends StatefulWidget {
  ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  String? email, password;
  bool isloading=false;
  GlobalKey<FormState> formKey=GlobalKey();
  TextEditingController emailController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: kprimaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: ModalProgressHUD(
          inAsyncCall: isloading,
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AuthHead(name: 'Reset Password'),
                  CustumeTextField(
                    textEditingController: emailController,
                    textInputType: TextInputType.emailAddress,
                    ispass: false,
                    validetor: (value) {
                      if (value.isEmpty) {
                        return 'Please enter an email address';
                      }
                      if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
                          .hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null; // Validation passed
                    },
                    onchange: (data) {
                      email = data;
                      setState(() {});
                    },
                    hint: "Email",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                      text: 'Reset Password',
                      function: ()  {
                        reset();
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  RegisterRow(text: '  login', screen: LoginPage())
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  void reset()async{
    if(formKey.currentState!.validate())
    {
      setState(() {
        isloading=true;
      });
      await Auth.resetPassword(email: emailController.text, ctx: context);
      setState(() {
        isloading=false;
      });
    }
  }
}