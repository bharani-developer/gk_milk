import 'package:flutter/material.dart';
import 'package:gk_milk/widgets/appbar.dart';
import 'package:nb_utils/nb_utils.dart';

import 'package:gk_milk/models/paymentcard_model.dart';
import 'package:gk_milk/utils/colors.dart';
import 'package:gk_milk/utils/constants.dart';
import 'package:gk_milk/utils/image.dart';
import 'package:gk_milk/utils/strings.dart';
import 'package:gk_milk/widgets/widgets.dart';
import 'package:gk_milk/widgets/sider_widget.dart';
import 'package:gk_milk/screens/DrawerScreen/AccountScreen/addcard_screen.dart';
import 'package:gk_milk/main.dart';

class ShPaymentsScreen extends StatefulWidget {
  static String tag = '/ShPaymentsScreen';

  const ShPaymentsScreen({super.key});

  @override
  ShPaymentsScreenState createState() => ShPaymentsScreenState();
}

class ShPaymentsScreenState extends State<ShPaymentsScreen> {
  List<ShPaymentCard> mPaymentCards = [];

  @override
  void initState() {
    super.initState();
    mPaymentCards.add(ShPaymentCard());
    mPaymentCards.add(ShPaymentCard());
    mPaymentCards.add(ShPaymentCard());
    mPaymentCards.add(ShPaymentCard());
    mPaymentCards.add(ShPaymentCard());
    mPaymentCards.add(ShPaymentCard());
  }

  @override
  Widget build(BuildContext context) {
    var paymentDetail = Container(
      margin: const EdgeInsets.only(
          top: spacingstandardnew, bottom: spacingstandardnew),
      decoration:
          BoxDecoration(border: Border.all(color: view_color, width: 1.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(spacingstandardnew,
                spacingmiddle, spacingstandardnew, spacingmiddle),
            child: Text(lbl_payment_details, style: boldTextStyle()),
          ),
          const Divider(
            height: 1,
            color: view_color,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(spacingstandardnew,
                spacingmiddle, spacingstandardnew, spacingmiddle),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    text(lbl_offer),
                    Text(text_offer_not_available,
                        style: primaryTextStyle()),
                  ],
                ),
                8.height,
                Row(
                  children: <Widget>[
                    text(lbl_shipping_charge),
                    text(lbl_free,
                        textColor: Colors.green, fontFamily: fontMedium),
                  ],
                ),
                8.height,
                Row(
                  children: <Widget>[
                    text(lbl_total_amount),
                    text("₹70",
                        textColor: colorPrimary,
                        fontFamily: fontBold,
                        fontSize: textSizeLargeMedium),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );

    return Scaffold(
        appBar: const MyAppBar(
        tittle: title_payment,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(spacingstandardnew),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(lbl_quick_pay, style: boldTextStyle()),
                  MaterialButton(
                    textColor: primaryColor,
                    padding: const EdgeInsets.only(
                        left: spacingstandardnew,
                        right: spacingstandardnew,
                        top: 0,
                        bottom: 0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(spacinglarge),
                      side: const BorderSide(color: primaryColor),
                    ),
                    onPressed: () {
                      AddCardScreen().launch(context);
                    },
                    child: text(lbl_add_card,
                        fontSize: textSizeSMedium, textColor: colorPrimary),
                  )
                ],
              ),
            ),
            ShPaymentCards(mPaymentCards),
            Padding(
              padding: const EdgeInsets.all(spacingstandardnew),
              child: Column(
                children: <Widget>[
                  divider(),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context, true);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: spacingstandardnew,
                          bottom: spacingstandardnew),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.credit_card,
                              color: appStore.isDarkModeOn
                                  ? white
                                  : textColorPrimary),
                          16.width,
                          Text(lbl_pay_with_debit_credit_card,
                              style: primaryTextStyle()),
                        ],
                      ),
                    ),
                  ),
                  divider(),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context, true);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: spacingstandardnew,
                          bottom: spacingstandardnew),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.credit_card,
                              color: appStore.isDarkModeOn
                                  ? white
                                  : textColorPrimary),
                          16.width,
                          Text(lbl_caon_delivery,
                              style: primaryTextStyle()),
                        ],
                      ),
                    ),
                  ),
                  divider(),
                  paymentDetail
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ShPaymentCards extends StatelessWidget {
  List<ShPaymentCard> mSliderList;

  ShPaymentCards(this.mSliderList, {super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    width = width - 50;
    return ShCarouselSlider(
      viewportFraction: 0.9,
      height: 210,
      enlargeCenterPage: true,
      scrollDirection: Axis.horizontal,
      items: mSliderList.map((slider) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: 210,
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Stack(
                children: [
                  Image.asset(ic_card,
                      fit: BoxFit.fill,
                      width: MediaQuery.of(context).size.width,
                      height: 210),
                  Padding(
                      padding: const EdgeInsets.all(14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              text("Debit card",
                                  textColor: white,
                                  fontSize: textSizeLargeMedium,
                                  fontFamily: fontBold),
                              text("MVK Bank",
                                  textColor: white,
                                  fontSize: textSizeLargeMedium,
                                  fontFamily: fontBold)
                            ],
                          ),
                          const SizedBox(
                            height: spacingmiddle,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Image.asset(
                                  chip,
                                  width: 50,
                                  height: 30,
                                  fit: BoxFit.fill,
                                ),
                                const SizedBox(
                                  height: spacingstandardnew,
                                ),
                                text("3434 3434 3434",
                                    textColor: white,
                                    fontFamily: fontMedium,
                                    fontSize: textSizeLargeMedium),
                                text("valid 12/12",
                                    textColor: white,
                                    fontSize: textSizeSMedium),
                                const SizedBox(
                                  height: spacingstandard,
                                ),
                                Expanded(
                                    child: text("JOHN",
                                        textColor: white,
                                        fontFamily: fontMedium,
                                        fontSize: textSizeMedium)),
                              ],
                            ),
                          )
                        ],
                      )),
                ],
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
