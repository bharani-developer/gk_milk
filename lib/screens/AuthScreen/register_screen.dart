import 'package:flutter/material.dart';
import 'package:gk_milk/utils/strings.dart';
import 'package:nb_utils/nb_utils.dart';

import 'package:gk_milk/models/app_model.dart';
import 'package:gk_milk/services/app_service.dart';
import 'package:gk_milk/utils/colors.dart';
import 'package:gk_milk/utils/image.dart';
import 'package:gk_milk/widgets/widgets.dart';
import 'package:gk_milk/main.dart';

class RegisterScreen extends StatefulWidget {
  static String tag = '/RegisterScreen';

  const RegisterScreen({super.key});

  @override
  RegisterScreenState createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  Appconfig? appconfig;

  fetchData() async {
    var model = await loadConfig();
    setState(() {
      appconfig = model;
    });
  }

  var fullNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  FocusNode fullNameFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passWordFocusNode = FocusNode();
  FocusNode confirmPassWordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: context.width(),
        height: context.height(),
        decoration: const BoxDecoration(
          image:
              DecorationImage(image: AssetImage(background), fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              50.height,
              Text("Register New User Account",
                  style: boldTextStyle(size: 24, color: black)),
              Container(
                margin: const EdgeInsets.all(16),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    Container(
                      width: context.width(),
                      padding: const EdgeInsets.only(
                          left: 16, right: 16, bottom: 16),
                      margin: const EdgeInsets.only(top: 55.0),
                      decoration: boxDecorationWithShadow(
                          borderRadius: BorderRadius.circular(30),
                          backgroundColor: context.cardColor),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              50.height,
                              Text(lbl_fullname,
                                  style: boldTextStyle(size: 14)),
                              8.height,
                              AppTextField(
                                decoration: waInputDecoration(
                                    hint: hint_fullname,
                                    prefixIcon: Icons.person_outline_outlined),
                                textFieldType: TextFieldType.NAME,
                                keyboardType: TextInputType.name,
                                controller: fullNameController,
                                focus: fullNameFocusNode,
                                nextFocus: emailFocusNode,
                              ),
                              16.height,
                              Text(lbl_mobileno,
                                  style: boldTextStyle(size: 14)),
                              8.height,
                              AppTextField(
                                decoration: waInputDecoration(
                                    hint: hint_mobileno,
                                    prefixIcon: Icons.phone_iphone_outlined),
                                textFieldType: TextFieldType.EMAIL,
                                keyboardType: TextInputType.phone,
                                controller: emailController,
                                focus: emailFocusNode,
                                nextFocus: passWordFocusNode,
                              ),
                              16.height,
                              Text(lbl_Password,
                                  style: boldTextStyle(size: 14)),
                              8.height,
                              AppTextField(
                                decoration: waInputDecoration(
                                    hint: hint_password,
                                    prefixIcon: Icons.lock_outline),
                                suffixIconColor: primaryColor,
                                textFieldType: TextFieldType.PASSWORD,
                                isPassword: true,
                                keyboardType: TextInputType.visiblePassword,
                                controller: passwordController,
                                focus: passWordFocusNode,
                                nextFocus: confirmPassWordFocusNode,
                              ),
                              16.height,
                              Text(lbl_confirmpwd,
                                  style: boldTextStyle(size: 14)),
                              8.height,
                              AppTextField(
                                decoration: waInputDecoration(
                                    hint: hint_repassword,
                                    prefixIcon: Icons.lock_outline),
                                suffixIconColor: primaryColor,
                                textFieldType: TextFieldType.PASSWORD,
                                isPassword: true,
                                keyboardType: TextInputType.visiblePassword,
                                controller: passwordController,
                                focus: confirmPassWordFocusNode,
                              ),
                              30.height,
                              AppButton(
                                      text: lbl_reg,
                                      color: primaryColor,
                                      textColor: Colors.white,
                                      shapeBorder:
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                      width: context.width(),
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, '/addprofilescreen');
                                      })
                                  .paddingOnly(
                                      left: context.width() * 0.1,
                                      right: context.width() * 0.1),
                              30.height,
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(lbl_alreadyac,
                                      style:
                                          primaryTextStyle(color: Colors.grey)),
                                  4.width,
                                  Text(lbl_login,
                                      style: boldTextStyle(
                                          color: appStore.isDarkModeOn
                                              ? white
                                              : black)),
                                ],
                              ).onTap(() {
                                Navigator.pushNamed(context, '/loginscreen');
                              }).center(),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 100,
                      width: 100,
                      decoration: boxDecorationRoundedWithShadow(30,
                          backgroundColor: context.cardColor),
                      child: Image.asset(
                        app_logo,
                        height: 60,
                        // color: appStore.isDarkModeOn ? white : black,
                        width: 60,
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
