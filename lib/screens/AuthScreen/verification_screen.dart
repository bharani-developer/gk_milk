import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import 'package:gk_milk/utils/colors.dart';
import 'package:gk_milk/utils/image.dart';
import 'package:gk_milk/main.dart';

class VerificationScreen extends StatefulWidget {
  static String tag = '/VerificationScreen';

  const VerificationScreen({super.key});

  @override
  VerificationScreenState createState() => VerificationScreenState();
}

class VerificationScreenState extends State<VerificationScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: boxDecorationWithRoundedCorners(
            backgroundColor: context.cardColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.withOpacity(0.2)),
          ),
          child: Icon(Icons.arrow_back,
              color: appStore.isDarkModeOn ? white : black),
        ).onTap(() {
          finish(context);
        }),
      ),
      body: Container(
        height: context.height(),
        width: context.width(),
        decoration: const BoxDecoration(
          image:
              DecorationImage(image: AssetImage(background), fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              30.height,
              Image.asset(
                verification_image,
              ),
              8.height,
              Text(
                'Verification',
                style: boldTextStyle(size: 20, color: black),
                textAlign: TextAlign.center,
              ),
              16.height,
              Text(
                'We have send a 4 digit verification code to your mail. Please enter the code below to verify it\'s you',
                style: secondaryTextStyle(color: gray),
                textAlign: TextAlign.center,
              ),
              30.height,
              Wrap(
                children: [
                  SizedBox(
                    height: 60,
                    child: OTPTextField(
                      pinLength: 4,
                      fieldWidth: 50,
                      onChanged: (value) {},
                      onCompleted: (value) {},
                    ),
                  ),
                ],
              ),
              16.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('I didn\'t get the Code.',
                      style: secondaryTextStyle(color: gray)),
                  4.width,
                  Text('Resend Code',
                      style: boldTextStyle(color: primaryColor),
                      textAlign: TextAlign.center),
                ],
              ),
              16.height,
              SizedBox(
                width: context.width() * 0.5,
                child: AppButton(
                    text: "Verify Me",
                    color: primaryColor,
                    textColor: Colors.white,
                    shapeBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    width: context.width(),
                    onTap: () {
                      Navigator.pushNamed(context, '/dashboardcreen');
                    }),
              ),
            ],
          ).paddingAll(30),
        ),
      ),
    );
  }
}
