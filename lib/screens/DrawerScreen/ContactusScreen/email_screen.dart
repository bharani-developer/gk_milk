import 'package:flutter/material.dart';
import 'package:gk_milk/widgets/appbar.dart';
import 'package:nb_utils/nb_utils.dart';

import 'package:gk_milk/utils/colors.dart';
import 'package:gk_milk/utils/constants.dart';
import 'package:gk_milk/utils/strings.dart';
import 'package:gk_milk/widgets/widgets.dart';

class ShEmailScreen extends StatefulWidget {
  static String tag = '/ShEmailScreen';

  const ShEmailScreen({super.key});

  @override
  ShEmailScreenState createState() => ShEmailScreenState();
}

class ShEmailScreenState extends State<ShEmailScreen> {
  var emailCont = TextEditingController();
  var descriptionCont = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {
      emailCont.text = lbl_reference_email;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
                 appBar: const MyAppBar(
        tittle: lbl_email,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: emailCont,
              enabled: false,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              textCapitalization: TextCapitalization.words,
              style: primaryTextStyle(),
              autofocus: false,
              decoration: formFieldDecoration(lbl_email_to_gk),
            ),
            16.height,
            TextFormField(
              controller: descriptionCont,
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.next,
              textCapitalization: TextCapitalization.words,
              style: primaryTextStyle(),
              autofocus: false,
              decoration: formFieldDecoration(lbl_description),
            ),
            50.height,
            MaterialButton(
              height: 50,
              minWidth: double.infinity,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0)),
              onPressed: () {},
              color: primaryColor,
              child: text(lbl_send_mail,
                  fontFamily: fontMedium,
                  fontSize: textSizeLargeMedium,
                  textColor: white),
            )
          ],
        ),
      ),
    );
  }
}
