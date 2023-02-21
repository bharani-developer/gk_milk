import 'dart:async';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart' as otp;
import 'package:otp_text_field/style.dart';
import 'package:nb_utils/nb_utils.dart';

import 'package:gk_milk/utils/colors.dart';
import 'package:gk_milk/utils/common.dart';
import 'package:gk_milk/utils/strings.dart';
import 'package:gk_milk/main.dart';

class ForgetPasswordScreen extends StatefulWidget {
  static String tag = '/ForgetPasswordScreen';

  const ForgetPasswordScreen({super.key});

  @override
  ForgetPasswordScreenState createState() => ForgetPasswordScreenState();
}

class ForgetPasswordScreenState extends State<ForgetPasswordScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  double buttonOpacity = 1.0;
  double buttonHeight = 50.0;
  double containerOpacity = 0.0;
  String? phoneNumber = '+91 1234567890';

  Duration get duration => controller.duration! * controller.value;

  bool get expired => duration.inSeconds == 0;
  int endTime = DateTime.now().millisecond + 1000 * 30;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    );
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void dispose() {
    super.dispose();
    changeStatusColor(appStore.isDarkModeOn ? scaffoldDarkColor : white);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 24.0),
            height: context.height(),
            decoration: boxDecorationWithRoundedCorners(
                backgroundColor: context.cardColor),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  64.height,
                  Text(lbl_Enter_code, style: boldTextStyle(size: 24)),
                  8.height,
                  // ignore: deprecated_member_use
                  createRichText(list: [
                    TextSpan(
                        text: lbl_Authentication_msg,
                        style: secondaryTextStyle()),
                    TextSpan(
                        text: phoneNumber!,
                        style: boldTextStyle(color: primaryColor)),
                  ]),
                  16.height,
                  otpField(),
                  24.height,
                  Row(
                    children: [
                      Text(lbl_Have_no_code, style: primaryTextStyle()),
                      8.width,
                      Text(
                        'Re-send',
                        style: boldTextStyle(
                            color: primaryColor,
                            decoration: TextDecoration.underline),
                      ),
                      const Text('01:58', textAlign: TextAlign.right).expand()
                    ],
                  ),
                  24.height,
                  SizedBox(
                    height: buttonHeight,
                    child: AppButton(
                      width: double.infinity,
                      color: primaryColor,
                      onTap: () {
                        setState(() {
                          buttonOpacity = 0.0;
                          buttonHeight = 0.0;
                          containerOpacity = 1.0;
                        });
                      },
                      child: Text(lbl_Done, style: boldTextStyle(color: white)),
                    ),
                  ).opacity(opacity: buttonOpacity),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Divider(height: 0.5),
                      32.height,
                      Text(lbl_Add_password, style: boldTextStyle(size: 20)),
                      8.height,
                      AppTextField(
                        textFieldType: TextFieldType.PASSWORD,
                        decoration: InputDecoration(
                          labelText: lbl_Password,
                          labelStyle: secondaryTextStyle(size: 16),
                          prefixIcon: Icon(Icons.lock_outline,
                              size: 20,
                              color: appStore.isDarkModeOn ? white : black),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: mlColorLightGrey.withOpacity(0.2)),
                          ),
                        ),
                      ),
                      16.height,
                      AppTextField(
                        textFieldType: TextFieldType.PASSWORD,
                        decoration: InputDecoration(
                          labelText: lbl_Renter_password,
                          labelStyle: secondaryTextStyle(size: 16),
                          prefixIcon: Icon(Icons.lock_outline,
                              size: 20,
                              color: appStore.isDarkModeOn ? white : black),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: mlColorLightGrey.withOpacity(0.2)),
                          ),
                        ),
                      ),
                      32.height,
                      AppButton(
                        width: double.infinity,
                        color: primaryColor,
                        onTap: () {
                          finish(context);
                          finish(context);
                          // return const MLLoginScreen().launch(context);
                        },
                        child:
                            Text(lbl_Done, style: boldTextStyle(color: white)),
                      ),
                    ],
                  ).opacity(opacity: containerOpacity),
                ],
              ).paddingAll(16.0),
            ),
          ),
          Positioned(
              top: 30,
              child: mlBackToPrevious(
                  context, appStore.isDarkModeOn ? white : black)),
        ],
      ),
    );
  }

  Widget otpField() {
    return Wrap(
      children: <Widget>[
        otp.OTPTextField(
          length: 6,
          width: double.infinity,
          fieldWidth: 35,
          style: boldTextStyle(size: 24),
          textFieldAlignment: MainAxisAlignment.spaceBetween,
          fieldStyle: FieldStyle.underline,
          onCompleted: (pin) {
            // ignore: avoid_print
            print("Completed: $pin");
          },
        ),
      ],
    );
  }
}
