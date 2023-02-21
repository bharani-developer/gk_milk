// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:gk_milk/widgets/appbar.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:gk_milk/main.dart';
import 'package:gk_milk/screens/DrawerScreen/ContactusScreen/email_screen.dart';

import 'package:gk_milk/utils/colors.dart';
import 'package:gk_milk/utils/constants.dart';
import 'package:gk_milk/utils/strings.dart';
import 'package:gk_milk/widgets/widgets.dart';

class ContactUsScreen extends StatefulWidget {
  static String tag = '/ContactUsScreen';

  const ContactUsScreen({super.key});

  @override
  ContactUsScreenState createState() => ContactUsScreenState();
}

class ContactUsScreenState extends State<ContactUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        tittle: lbl_contact_us,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            InkWell(
              onTap: () {
                launch("tel:$contact_phone");
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(lbl_call_request, style: primaryTextStyle()),
                      Icon(Icons.keyboard_arrow_right,
                          color:
                              appStore.isDarkModeOn ? white : textColorPrimary),
                    ],
                  ),
                  Text(contact_phone, style: secondaryTextStyle()),
                  const SizedBox(height: spacingstandardnew),
                  divider()
                ],
              ),
            ),
            const SizedBox(height: spacingstandardnew),
            InkWell(
              onTap: () {
                const ShEmailScreen().launch(context);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(lbl_email, style: primaryTextStyle()),
                      Icon(
                        Icons.keyboard_arrow_right,
                        color: appStore.isDarkModeOn ? white : textColorPrimary,
                      )
                    ],
                  ),
                  Text("Response within 24 business hours",
                      style: secondaryTextStyle()),
                  const SizedBox(height: spacingstandardnew),
                  divider()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
