import 'package:flutter/material.dart';
import 'package:gk_milk/utils/strings.dart';
import 'package:nb_utils/nb_utils.dart';

import 'package:gk_milk/models/app_model.dart';
import 'package:gk_milk/services/app_service.dart';
import 'package:gk_milk/utils/colors.dart';
import 'package:gk_milk/utils/image.dart';

class WalkThroughScreen extends StatefulWidget {
  static String tag = '/WalkThroughScreen';

  const WalkThroughScreen({super.key});

  @override
  WalkThroughScreenState createState() => WalkThroughScreenState();
}

class WalkThroughScreenState extends State<WalkThroughScreen> {
  PageController pageController = PageController();
  Appconfig? appconfig;
  fetchData() async {
    var model = await loadConfig();
    setState(() {
      appconfig = model;
    });
  }

  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    init();
    fetchData();
  }

  init() async {
    setStatusBarColor(Colors.transparent,
        statusBarIconBrightness: Brightness.dark);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    setStatusBarColor(primaryColor, statusBarIconBrightness: Brightness.light);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
        actions: [
          Text(lbl_Skip, style: boldTextStyle(size: 14, color: black))
              .onTap(() {
            Navigator.pushNamed(context, '/loginscreen');
          }).paddingOnly(top: 16, right: 16),
        ],
      ),
      backgroundColor: Colors.white,
      body: Container(
        width: context.width(),
        height: context.height(),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(background), fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 400,
                width: context.width(),
                child: PageView(
                  controller: pageController,
                  children: appconfig!.walkthrogh.map(
                    (e) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            e.image.validate(),
                            fit: BoxFit.cover,
                            width: 250,
                            height: 250,
                          ),
                          Text(e.title.validate(),
                                  style: boldTextStyle(size: 20, color: black))
                              .paddingOnly(left: 16, right: 16),
                          16.height,
                          Text(e.description.validate(),
                                  style: secondaryTextStyle(color: gray),
                                  textAlign: TextAlign.center)
                              .paddingOnly(left: 16, right: 16),
                        ],
                      );
                    },
                  ).toList(),
                  onPageChanged: (index) {
                    setState(
                      () {
                        currentPage = index;
                      },
                    );
                  },
                ),
              ),
              30.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < appconfig!.walkthrogh.length; i++)
                    Icon(Icons.add,
                        color: i == currentPage ? primaryColor : Colors.grey),
                ],
              ),
              16.height,
              Container(
                height: 60,
                width: 60,
                padding: const EdgeInsets.all(18),
                decoration: boxDecorationWithRoundedCorners(
                    boxShape: BoxShape.circle, backgroundColor: primaryColor),
                child: Image.asset(navigate_next,
                    color: Colors.white,
                    height: 14,
                    width: 14,
                    fit: BoxFit.cover),
              ).onTap(
                () {
                  if (currentPage == 2) {
                    Navigator.pushNamed(context, '/loginscreen');
                  } else {
                    pageController.animateToPage(currentPage + 1,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.linear);
                  }
                },
              ),
            ],
          ),
        ).center(),
      ),
    );
  }
}
