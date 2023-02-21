import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import 'package:gk_milk/models/category_model.dart';
import 'package:gk_milk/utils/colors.dart';
import 'package:gk_milk/utils/constants.dart';
import 'package:gk_milk/utils/extension.dart';
import 'package:gk_milk/utils/image.dart';
import 'package:gk_milk/utils/strings.dart';
import 'package:gk_milk/widgets/widgets.dart';
import 'package:gk_milk/screens/DrawerScreen/AccountScreen/account_screen.dart';
import 'package:gk_milk/screens/DrawerScreen/ContactusScreen/contactus_screen.dart';
import 'package:gk_milk/screens/DrawerScreen/FaqScreen/faq_screen.dart';
import 'package:gk_milk/screens/DrawerScreen/OrderScreen/orderlist_screen.dart';
import 'package:gk_milk/screens/DrawerScreen/SettingsScreen/settings_screen.dart';
// import 'package:gk_milk/screens/TabScreen/HomeScreen/subcategory_screen.dart';
import 'package:gk_milk/main.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  List<ShCategory> list = [];

  ///
  int currentIndexPage = 0;
  var selectedTab = 0;

  int? pageLength;
  @override
  void initState() {
    setStatusBarColor(palColor);

    super.initState();
    fetchData();
    currentIndexPage = 0;
    pageLength = 3;
  }

  fetchData() async {
    loadCategory().then(
      (categories) {
        setState(() {
          list.clear();
          list.addAll(categories);
        });
      },
    ).catchError(
      (error) {
        toasty(context, error);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.85,
      height: MediaQuery.of(context).size.height,
      child: Drawer(
        elevation: 8,
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            color: appStore.isDarkModeOn ? scaffoldDarkColor : white,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Center(
                      child: Padding(
                          padding: const EdgeInsets.only(
                              top: 60, right: spacinglarge),
                          child: Column(
                            children: <Widget>[
                              Card(
                                semanticContainer: true,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                elevation: spacingstandard,
                                margin: const EdgeInsets.all(spacingcontrol),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100.0)),
                                child: const Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: CircleAvatar(
                                      backgroundImage: AssetImage(ic_user),
                                      radius: 55),
                                ),
                              ),
                              const SizedBox(height: spacingmiddle),
                              Text(
                                "Bharani",
                                style: boldTextStyle(
                                    color: appStore.isDarkModeOn
                                        ? white
                                        : textColorPrimary,
                                    size: 18),
                              )
                            ],
                          )),
                    ),
                    const Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                            padding: EdgeInsets.only(
                                left: spacingstandardnew, top: 30),
                            child: Icon(Icons.clear)))
                  ],
                ),
                const SizedBox(height: 30),
                Container(
                  color: context.cardColor,
                  padding: const EdgeInsets.fromLTRB(
                      0, spacingstandard, 0, spacingstandard),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            const OrderListScreen().launch(context);
                          },
                          child: Column(
                            children: <Widget>[
                              text("08",
                                  textColor: colorPrimary,
                                  fontFamily: fontMedium),
                              const SizedBox(height: spacingcontrol),
                              text("My Order",
                                  textColor: appStore.isDarkModeOn
                                      ? white
                                      : textColorPrimary,
                                  fontFamily: fontMedium),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                            setState(() {
                              selectedTab = 1;
                            });
                          },
                          child: Column(
                            children: <Widget>[
                              text("07",
                                  textColor: colorPrimary,
                                  fontFamily: fontMedium),
                              const SizedBox(height: spacingcontrol),
                              text("Days Left",
                                  textColor: appStore.isDarkModeOn
                                      ? white
                                      : textColorPrimary,
                                  fontFamily: fontMedium),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: list.length,
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemBuilder: (context, index) {
                    return getDrawerItem(
                      list[index].image,
                      list[index].name,
                      callback: () {
                        // SubCategory(category: list[index]).launch(context);
                      },
                    );
                  },
                ),
                const SizedBox(height: 30),
                const Divider(color: view_color, height: 1),
                const SizedBox(height: 20),
                getDrawerItem(
                  user_placeholder,
                  Account,
                  callback: () {
                    const AccountScreen().launch(context);

                    // bool isWishlist = launchScreen(context, AccountScreen.tag) ?? false;
                    //  if (isWishlist) {
                    //    selectedTab = 1;
                    //    setState(() {});
                    //  }
                  },
                ),
                getDrawerItem(
                  ic_settings,
                  lbl_settings,
                  callback: () {
                    const SettingsScreen().launch(context);
                  },
                ),
                const SizedBox(height: 20),
                getDrawerItem(
                  null,
                  lbl_faq,
                  callback: () {
                    const FAQScreen().launch(context);
                  },
                ),
                getDrawerItem(
                  null,
                  lbl_contact_us,
                  callback: () {
                    const ContactUsScreen().launch(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget getDrawerItem(String? icon, String? name, {VoidCallback? callback}) {
  return InkWell(
    onTap: callback,
    child: Container(
      color: appStore.isDarkModeOn ? scaffoldDarkColor : white,
      padding: const EdgeInsets.fromLTRB(20, 14, 20, 14),
      child: Row(
        children: <Widget>[
          icon != null
              ? Image.asset(icon,
                  width: 20,
                  height: 20,
                  color: appStore.isDarkModeOn ? white : black)
              : Container(width: 20),
          const SizedBox(width: 20),
          Text(name!,
              style: primaryTextStyle(
                  color: appStore.isDarkModeOn ? white : textColorPrimary))
        ],
      ),
    ),
  );
}
