import 'package:btcar_1/constant.dart';
import 'package:btcar_1/model/user_model.dart';
import 'package:btcar_1/services/auth_services.dart';
import 'package:btcar_1/widgets/auth_head.dart';
import 'package:btcar_1/widgets/custome_button.dart';
import 'package:btcar_1/widgets/custome_text_filed.dart';
import 'package:btcar_1/widgets/register_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/constants.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'login.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _ChildRegisterPageState();
}

class _ChildRegisterPageState extends State<RegisterPage> {
  String? email;
  String? name;
  String? password;
  String? fatherCode;
  String? age;
  bool islodaing = false;

  GlobalKey<FormState> formKey = GlobalKey();

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    ageController.dispose();
    emailController.dispose();
    passController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: ksecondaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: ModalProgressHUD(
          inAsyncCall: islodaing,
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AuthHead(name: "Register"),
                  CustumeTextField(
                    textInputType: TextInputType.name,
                    textEditingController: nameController,
                    labelText: 'Name',
                    ispass: false,
                    validetor: (value) {
                      if (value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null; // Validation passed
                    },
                    onchange: (data) {
                      name = data;
                      setState(() {});
                    },
                    hint: "John Smith",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustumeTextField(
                    textInputType: TextInputType.number,
                    textEditingController: ageController,
                    labelText: 'Age',
                    ispass: false,
                    validetor: (value) {
                      if (value.isEmpty) {
                        return 'Please enter your Age';
                      }
                      return null; // Validation passed
                    },
                    onchange: (data) {
                      age = data;
                      setState(() {});
                    },
                    hint: "12",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustumeTextField(
                    textInputType: TextInputType.emailAddress,
                    textEditingController: emailController,
                    labelText: "Email",
                    ispass: false,
                    validetor: (value) {
                      if (value.isEmpty) {
                        return 'Please enter an email address';
                      }
                      if (!RegExp(
                              r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
                          .hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null; // Validation passed
                    },
                    onchange: (data) {
                      email = data;
                      setState(() {});
                    },
                    hint: "example@gmial.com",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustumeTextField(
                    validetor: (v){},
                    textEditingController: phoneController,
                    textInputType: TextInputType.phone,
                    onchange: (n){},
                    hint: '0123456789',
                    labelText: 'Phone',
                    ispass: false,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustumeTextField(
                    textInputType: TextInputType.visiblePassword,
                    textEditingController: passController,
                    labelText: "Password",
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
                    hint: "*********",
                    ispass: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    text: "Register",
                    function: () async {
                      register(
                          userModel: UserModel(
                        id: 'id',
                        phone: phoneController.text,
                        name: nameController.text,
                        age: ageController.text,
                        email: emailController.text,
                        password: passController.text,
                        admin: false,
                      ));

                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  RegisterRow(text: '  login', screen: LoginPage()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void register({userModel}) async {
    if (formKey.currentState!.validate()) {
      islodaing = true;
      setState(() {});
      await Auth.register(userModel: userModel, ctx: context);
      islodaing = false;
      setState(() {});
    }
  }
}
