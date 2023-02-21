import 'package:flutter/material.dart';
import 'package:gk_milk/widgets/appbar.dart';
import 'package:nb_utils/nb_utils.dart';

import 'package:gk_milk/utils/colors.dart';
import 'package:gk_milk/utils/constants.dart';
import 'package:gk_milk/utils/image.dart';
import 'package:gk_milk/utils/strings.dart';
import 'package:gk_milk/widgets/widgets.dart';

import 'package:gk_milk/screens/DrawerScreen/AccountScreen/adressmanager_screen.dart';
import 'package:gk_milk/screens/DrawerScreen/AccountScreen/offers_screen.dart';
import 'package:gk_milk/screens/DrawerScreen/AccountScreen/quickpaycards_screen.dart';
import 'package:gk_milk/screens/DrawerScreen/OrderScreen/orderlist_screen.dart';

import 'package:gk_milk/main.dart';

class AccountScreen extends StatefulWidget {
  static String tag = '/AccountScreen';

  const AccountScreen({super.key});

  @override
  AccountScreenState createState() => AccountScreenState();
}

class AccountScreenState extends State<AccountScreen> {
  var firstNameCont = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {
      firstNameCont.text = "+919566935886";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
              appBar: const MyAppBar(tittle: Account,),

      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            30.height,
            Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              elevation: spacingstandard,
              margin: const EdgeInsets.all(spacingcontrol),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0)),
              child: const CircleAvatar(
                      backgroundImage: AssetImage(ic_user), radius: 60)
                  .paddingAll(4),
            ),
            Text("Bharani Karthikeyan", style: boldTextStyle(size: 24)),
            Container(
              margin: const EdgeInsets.all(spacingstandardnew),
              padding: const EdgeInsets.all(spacingmiddle),
              decoration:
                  BoxDecoration(border: Border.all(color: viewcolor, width: 1)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(lbl_please_verify_your_number,
                          style: primaryTextStyle()),
                      Image.asset(ic_radar, width: 30, height: 30).expand(),
                    ],
                  ),
                  2.height,
                  Text(lbl_get_newest_offers, style: secondaryTextStyle()),
                  16.height,
                  Stack(
                    alignment: Alignment.topRight,
                    children: <Widget>[
                      TextFormField(
                        keyboardType: TextInputType.text,
                        autofocus: false,
                        controller: firstNameCont,
                        textCapitalization: TextCapitalization.words,
                        style: primaryTextStyle(),
                        decoration: InputDecoration(
                            filled: false,
                            contentPadding: const EdgeInsets.fromLTRB(
                                20.0, 12.0, 20.0, 12.0),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(32.0),
                                borderSide: BorderSide(
                                    color: Colors.grey.withOpacity(0.5),
                                    width: 0.5)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(32.0),
                                borderSide: BorderSide(
                                    color: Colors.grey.withOpacity(0.5),
                                    width: 0))),
                      ),
                      MaterialButton(
                        padding:
                            const EdgeInsets.fromLTRB(20.0, 12.0, 20.0, 12.0),
                        textColor: white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40.0)),
                        color: primaryColor,
                        onPressed: () => {},
                        child: text(lbl_verify_now,
                            fontSize: textSizeMedium,
                            fontFamily: fontMedium,
                            textColor: white),
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: spacingstandardnew,
                  bottom: spacingstandardnew,
                  right: spacingstandardnew),
              child: Column(
                children: <Widget>[
                  getRowItem(lbl_address_manager, callback: () {
                    const AddressManagerScreen().launch(context);
                  }),
                  const SizedBox(height: spacingstandardnew),
                  getRowItem(myOrder, callback: () {
                    const OrderListScreen().launch(context);
                  }),
                  const SizedBox(height: spacingstandardnew),
                  getRowItem(lbl_my_offers, callback: () {
                    const OffersScreen().launch(context);
                  }),
                  // const SizedBox(height: spacingstandardnew),
                  // getRowItem(wishList, callback: () {
                  //   finish(context);
                  // }),
                  const SizedBox(height: spacingstandardnew),
                  getRowItem(lbl_quick_pay_cards, callback: () {
                    const QuickPayCardsScreen().launch(context);
                  }),
                  const SizedBox(height: spacingstandardnew),
                  getRowItem(lbl_help_center),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    // height: double.infinity,
                    child: MaterialButton(
                      padding: const EdgeInsets.all(spacingstandard),
                      textColor: white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                          side:
                              const BorderSide(color: primaryColor, width: 1)),
                      color: context.cardColor,
                      onPressed: () => {finish(context)},
                      child: text("Sign Out",
                          fontSize: textSizeNormal,
                          fontFamily: fontMedium,
                          textColor: primaryColor),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getRowItem(String title, {VoidCallback? callback}) {
    return InkWell(
      onTap: callback,
      child: Container(
        decoration:
            BoxDecoration(border: Border.all(color: viewcolor, width: 1)),
        padding: const EdgeInsets.fromLTRB(
            spacingstandard, 0, spacingcontrolhalf, 0),
        child: Row(
          children: <Widget>[
            Expanded(child: Text(title, style: primaryTextStyle())),
            IconButton(
              icon: Icon(Icons.keyboard_arrow_right,
                  color: appStore.isDarkModeOn ? white : textColorPrimary,
                  size: 24),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
