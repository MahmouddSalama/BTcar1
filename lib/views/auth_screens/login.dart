

import 'package:btcar_1/constant.dart';
import 'package:btcar_1/services/auth_services.dart';
import 'package:btcar_1/views/auth_screens/register_screen.dart';

import 'package:btcar_1/views/auth_screens/reset_password.dart';
import 'package:btcar_1/widgets/auth_head.dart';
import 'package:btcar_1/widgets/custome_button.dart';
import 'package:btcar_1/widgets/custome_text_filed.dart';
import 'package:btcar_1/widgets/register_row.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController =TextEditingController();
  TextEditingController passController =TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passController.dispose();
  }
  String? email, password;
  bool isloading=false;
  GlobalKey<FormState> formKey=GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: ksecondaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: ModalProgressHUD(
          inAsyncCall: isloading,
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AuthHead(name: "LOGIN"),
                  CustumeTextField(
                    textEditingController: emailController,
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
                  CustumeTextField(
                    textEditingController: passController,
                    validetor: (data) {
                      if (data.isEmpty) {
                        return 'Please enter a password';
                      }
                      // Simple password length check
                      if (data.length < 8) {
                        return 'Password must be at least 8 characters long';
                      }
                      return null; // Validation passed
                    },
                    onchange: (data) {
                      password = data;
                      setState(() {});
                    },
                    hint: "Password",
                    ispass: true,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                            return ResetPassword();
                          }));
                    },
                    child: Text(
                      "Reset Password",
                      style: const TextStyle(
                        color: Colors.orange,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                      text: 'Login',
                      function: ()  {
                        login();
                      }),
                  const SizedBox(
                    height: 20,
                  ),

                  const SizedBox(
                    height: 30,
                  ),
                  RegisterRow(text: "  Register", screen: RegisterPage()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void login() async{
    print("login");
    if (formKey.currentState!.validate()){
      isloading = true;
      setState(() {});
      await Auth.login(email: emailController.text, password: passController.text, ctx: context);
      isloading = false;
      setState(() {});
    }
  }
}


