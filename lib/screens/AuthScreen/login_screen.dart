import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import 'package:gk_milk/models/app_model.dart';
import 'package:gk_milk/services/app_service.dart';
import 'package:gk_milk/utils/strings.dart';
import 'package:gk_milk/utils/colors.dart';
import 'package:gk_milk/utils/image.dart';
import 'package:gk_milk/widgets/widgets.dart';
import 'package:gk_milk/screens/home_screen.dart';
import 'package:gk_milk/main.dart';

class LoginScreen extends StatefulWidget {
  static String tag = '/LoginScreen';

  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  Appconfig? appconfig;
  fetchData() async {
    var model = await loadConfig();
    setState(() {
      appconfig = model;
    });
  }

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passWordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    init();
    fetchData();
  }

  Future<void> init() async {}

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
            image: DecorationImage(
                image: AssetImage(background), fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              50.height,
              Text("User Log In", style: boldTextStyle(size: 24, color: black)),
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
                              const SizedBox(
                                height: 50,
                              ),
                              Text(lbl_phno, style: boldTextStyle(size: 14)),
                              8.height,
                              AppTextField(
                                decoration: waInputDecoration(
                                    hint: lbl_phnohint,
                                    prefixIcon: Icons.phone_iphone_outlined),
                                textFieldType: TextFieldType.EMAIL,
                                keyboardType: TextInputType.emailAddress,
                                controller: emailController,
                                focus: emailFocusNode,
                                nextFocus: passWordFocusNode,
                              ),
                              16.height,
                              Text("Password", style: boldTextStyle(size: 14)),
                              8.height,
                              AppTextField(
                                decoration: waInputDecoration(
                                    hint: 'Enter your password here',
                                    prefixIcon: Icons.lock_outline),
                                suffixIconColor: primaryColor,
                                textFieldType: TextFieldType.PASSWORD,
                                isPassword: true,
                                keyboardType: TextInputType.visiblePassword,
                                controller: passwordController,
                                focus: passWordFocusNode,
                              ),
                              16.height,
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text("Forgot password?",
                                    style: primaryTextStyle()),
                              ).onTap(() {
                                Navigator.pushNamed(context, '/forgetpassword');
                              }).center(),
                              30.height,
                              AppButton(
                                      text: "Log In",
                                      color: primaryColor,
                                      textColor: Colors.white,
                                      shapeBorder:
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                      width: context.width(),
                                      onTap: () {
                                        const DashboardScreen().launch(context);
                                      })
                                  .paddingOnly(
                                      left: context.width() * 0.1,
                                      right: context.width() * 0.1),
                              30.height,
                              // SizedBox(
                              //   width: 200,
                              //   child: Row(
                              //     children: [
                              //       const Divider(thickness: 2).expand(),
                              //       8.width,
                              //       Text('or',
                              //           style: boldTextStyle(
                              //               size: 16, color: Colors.grey)),
                              //       8.width,
                              //       const Divider(thickness: 2).expand(),
                              //     ],
                              //   ),
                              // ).center(),
                              // 30.height,
                              // Row(
                              //   mainAxisSize: MainAxisSize.min,
                              //   mainAxisAlignment: MainAxisAlignment.center,
                              //   children: [
                              //     Container(
                              //       decoration: boxDecorationRoundedWithShadow(
                              //           16,
                              //           backgroundColor: context.cardColor),
                              //       padding: const EdgeInsets.all(16),
                              //       child: Image.asset(facebook_logo,
                              //           width: 40, height: 40),
                              //     ),
                              //     30.width,
                              //     Container(
                              //       decoration: boxDecorationRoundedWithShadow(
                              //           16,
                              //           backgroundColor: context.cardColor),
                              //       padding: const EdgeInsets.all(16),
                              //       child: Image.asset(google_logo,
                              //           width: 40, height: 40),
                              //     ),
                              //   ],
                              // ).center(),
                              // 30.height,
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Don\'t have an account?',
                                      style:
                                          primaryTextStyle(color: Colors.grey)),
                                  4.width,
                                  Text('Register here',
                                      style: boldTextStyle(
                                          color: appStore.isDarkModeOn
                                              ? white
                                              : black)),
                                ],
                              ).onTap(() {
                                Navigator.pushNamed(context, '/registerscreen');
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
                        appconfig!.applogo[0].image,
                        height: 60,
                        width: 60,
                        // color: appStore.isDarkModeOn ? white : black,
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                ),
              ),
              16.height,
            ],
          ),
        ),
      ),
    );
  }
}
