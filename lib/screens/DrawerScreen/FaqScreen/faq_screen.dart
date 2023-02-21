import 'package:flutter/material.dart';
import 'package:gk_milk/widgets/appbar.dart';
import 'package:nb_utils/nb_utils.dart';


import 'package:gk_milk/utils/constants.dart';
import 'package:gk_milk/utils/strings.dart';

class FAQScreen extends StatefulWidget {
  static String tag = '/FAQScreen';

  const FAQScreen({super.key});

  @override
  FAQScreenState createState() => FAQScreenState();
}

class FAQScreenState extends State<FAQScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MyAppBar(
        tittle: lbl_faq,
      ),

      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          ExpansionTile(
            title: getTitle(lbl_Account_deactivate),
            children: <Widget>[
              Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      getSubTitle(lbl_Account_deactivate),
                      getSubTitle(lbl_quick_pay),
                      getSubTitle(lbl_return_items),
                      getSubTitle(lbl_replace_items),
                    ],
                  )),
            ],
          ),
          ExpansionTile(
            title: getTitle(lbl_quick_pay),
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    getSubTitle(lbl_Account_deactivate),
                    getSubTitle(lbl_quick_pay),
                    getSubTitle(lbl_return_items),
                    getSubTitle(lbl_replace_items),
                  ],
                ),
              ),
            ],
          ),
          ExpansionTile(
            title: getTitle(lbl_return_items),
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    getSubTitle(lbl_Account_deactivate),
                    getSubTitle(lbl_quick_pay),
                    getSubTitle(lbl_return_items),
                    getSubTitle(lbl_replace_items),
                  ],
                ),
              ),
            ],
          ),
          ExpansionTile(
            title: getTitle(lbl_replace_items),
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    getSubTitle(lbl_Account_deactivate),
                    getSubTitle(lbl_quick_pay),
                    getSubTitle(lbl_return_items),
                    getSubTitle(lbl_replace_items),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget getTitle(String content) {
    return Text(content, style: primaryTextStyle());
  }

  Widget getSubTitle(String content) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
          16.0, spacingstandard, 16.0, spacingstandard),
      child: Text(content, style: secondaryTextStyle()),
    );
  }
}
