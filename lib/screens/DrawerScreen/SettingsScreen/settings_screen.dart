import 'package:flutter/material.dart';
import 'package:gk_milk/widgets/appbar.dart';
import 'package:nb_utils/nb_utils.dart';

import 'package:gk_milk/utils/colors.dart';
import 'package:gk_milk/utils/constants.dart';
import 'package:gk_milk/utils/strings.dart';
import 'package:gk_milk/widgets/widgets.dart';
import 'package:gk_milk/main.dart';

class SettingsScreen extends StatefulWidget {
  static String tag = '/SettingsScreen';

  const SettingsScreen({super.key});

  @override
  SettingsScreenState createState() => SettingsScreenState();
}

class SettingsScreenState extends State<SettingsScreen> {
  bool pushNotification = false;
  bool smsNotification = false;
  bool emailNotification = false;
  String? selectedValue = "English(US)";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
                                appBar: const MyAppBar(tittle: lbl_settings,),

      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(
                  left: spacingstandardnew,
                  right: spacingstandardnew,
                  top: spacingstandardnew),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(lbl_punotification, style: primaryTextStyle()),
                      Switch(
                        value: pushNotification,
                        onChanged: (value) {
                          setState(() {
                            pushNotification = value;
                          });
                        },
                        activeColor: primaryColor,
                      )
                    ],
                  ),
                  Text(lbl_notification_arrive_on_order_status,
                      style: secondaryTextStyle()),
                  16.height,
                  divider()
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                  left: spacingstandardnew, right: spacingstandardnew),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(lbl_sms_notification, style: primaryTextStyle()),
                      Switch(
                        value: smsNotification,
                        onChanged: (value) {
                          setState(() {
                            smsNotification = value;
                          });
                        },
                        activeColor: primaryColor,
                      )
                    ],
                  ),
                  Text(contact_phone, style: secondaryTextStyle()),
                  const SizedBox(height: spacingstandardnew),
                  divider()
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                  left: spacingstandardnew, right: spacingstandardnew),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(lbl_email_notification,
                          style: primaryTextStyle()),
                      Switch(
                        value: emailNotification,
                        onChanged: (value) {
                          setState(() {
                            emailNotification = value;
                          });
                        },
                        activeColor: primaryColor,
                      )
                    ],
                  ),
                  Text(lbl_reference_email, style: secondaryTextStyle()),
                  const SizedBox(height: spacingstandardnew),
                  divider()
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                  left: spacingstandardnew, right: spacingstandardnew),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Dark Mode', style: primaryTextStyle()),
                      Switch(
                        value: appStore.isDarkModeOn,
                        activeColor: primaryColor,
                        onChanged: (s) {
                          setState(() {});
                          appStore.toggleDarkMode(value: s);
                        },
                      )
                    ],
                  ),
                  Text('Theme Setting', style: secondaryTextStyle()),
                  const SizedBox(height: spacingstandardnew),
                  divider()
                ],
              ),
            ),
            // Container(
            //   margin: const EdgeInsets.all(spacingstandardnew),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: <Widget>[
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: <Widget>[
            //           Text(lbl_language, style: primaryTextStyle()),
            //           DropdownButton<String>(
            //             underline: const SizedBox(),
            //             items: <String>["English(US)", "English(Canada)"]
            //                 .map((String value) {
            //               return DropdownMenuItem<String>(
            //                 value: value,
            //                 child: Text(value, style: primaryTextStyle()),
            //               );
            //             }).toList(),
            //             //hint:Text(selectedValue),
            //             value: selectedValue,
            //             onChanged: (newVal) {
            //               setState(() {
            //                 selectedValue = newVal;
            //               });
            //             },
            //           ),
            //         ],
            //       ),
            //       16.height,
            //       divider()
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
