
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:gk_milk/models/category_model.dart';
import 'package:gk_milk/models/product_model.dart';
import 'package:gk_milk/models/banking_model.dart';
import 'package:gk_milk/utils/colors.dart';
import 'package:gk_milk/utils/constants.dart';
import 'package:gk_milk/utils/extension.dart';
import 'package:gk_milk/utils/image.dart';
import 'package:gk_milk/utils/strings.dart';
import 'package:gk_milk/utils/data_provider.dart';
import 'package:gk_milk/widgets/appdrawer.dart';
import 'package:gk_milk/widgets/top_card.dart';
import 'package:gk_milk/widgets/widgets.dart';

// import 'package:gk_milk/screens/TabScreen/HomeScreen/subcategory_screen.dart';
// import 'package:gk_milk/screens/TabScreen/HomeScreen/viewsallproducts_screen.dart';

import 'package:gk_milk/main.dart';

class HomeScreen extends StatefulWidget {
  static String tag = '/HomeScreen';

  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {

final _pageController = PageController(
  initialPage: 0,
);



  List<ShCategory> list = [];
  List<String> banners = [];
  List<ShProduct> newestProducts = [];
  List<ShProduct> featuredProducts = [];

  var position = 0;
  var colors = [cat_1, cat_2, cat_3, cat_4, cat_5];
  var selectedTab = 0;

  ///
  int currentIndexPage = 0;
  int? pageLength;

  late List<BankingHomeModel> mList1;
  late List<BankingHomeModel2> mList2;

  @override
  void initState() {
    setStatusBarColor(palColor);
    super.initState();
    fetchData();
    currentIndexPage = 0;
    pageLength = 3;
    mList1 = bankingHomeList1();
    mList2 = bankingHomeList2();
    
  }

  fetchData() async {
    loadCategory().then((categories) {
      setState(() {
        list.clear();
        list.addAll(categories);
      });
    }).catchError((error) {
      toasty(context, error);
    });
    List<ShProduct> products = await loadProducts();
    List<ShProduct> featured = [];
    for (var product in products) {
      if (product.featured!) {
        featured.add(product);
      }
    }
    List<String> banner = [];
    for (var i = 1; i < 4; i++) {
      banner.add("assets/images/banners/b$i.png");
    }
    setState(() {
      newestProducts.clear();
      featuredProducts.clear();
      banners.clear();
      banners.addAll(banner);
      newestProducts.addAll(products);
      featuredProducts.addAll(featured);
    });
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.width;

    return Scaffold(
      drawer: const AppDrawer(),
      body: Container(
        height: context.height(),
        width: context.width(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: appStore.isDarkModeOn
                    ? const AssetImage(darkbackground)
                    : const AssetImage(background),
                fit: BoxFit.cover)),
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                expandedHeight: 275,
                floating: false,
                pinned: true,
                titleSpacing: 0,
                automaticallyImplyLeading: false,
                backgroundColor: appStore.isDarkModeOn
                    ? textColorPrimary
                    : Colors.transparent,
                actionsIconTheme: const IconThemeData(opacity: 0.0),
                leading: IconButton(
                  icon: const Icon(Icons.menu),
                  tooltip: 'Menu',
                  onPressed: () => Scaffold.of(context).openDrawer(),
                ),
                title: Container(
                  padding: const EdgeInsets.fromLTRB(0, 42, 16, 32),
                  margin: const EdgeInsets.only(bottom: 8, top: 8),
                  child: Row(
                    children: [
                      const CircleAvatar(
                          backgroundImage: AssetImage(ic_user), radius: 23),
                      5.width,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Hello,$lbl_username",
                            style: primaryTextStyle(color: textColorWhite),
                          ),
                          // Text(
                          //   lbl_welcome,
                          //   style: primaryTextStyle(color: textColorWhite),
                          // ),
                        ],
                      ).expand(),
                      cartIcon(context, 3)
                    ],
                  ),
                ),
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    children: [
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topLeft,
                            colors: <Color>[colorDarkBlue, palColor],
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(16, 80, 16, 8),
                        padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                        decoration: boxDecorationWithRoundedCorners(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: defaultBoxShadow(),
                          backgroundColor: context.cardColor,
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 130,
                              child: PageView(
                                children: const [
                                  TopCard(
                                      name: "Default Account",
                                      acno: lbl_accountNumber,
                                      bal:'\u{20B9}$lbl_accountBalance'),
                                ],
                              ),
                            ),
                            4.height,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding:
                                      const EdgeInsets.only(top: 8, bottom: 8),
                                  decoration: boxDecorationWithRoundedCorners(
                                    backgroundColor: primaryColor,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(Icons.payment,
                                          color: textColorWhite, size: 24),
                                      10.width,
                                      Text('Payment',
                                          style: boldTextStyle(
                                              color: textColorWhite)),
                                    ],
                                  ),
                                ).expand(),
                                10.width,
                                Container(
                                  padding:
                                      const EdgeInsets.only(top: 8, bottom: 8),
                                  decoration: boxDecorationWithRoundedCorners(
                                    backgroundColor: primaryColor,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(ic_Transfer,
                                          color: textColorWhite),
                                      10.width,
                                      Text('History',
                                          style: boldTextStyle(
                                              color: textColorWhite)),
                                    ],
                                  ),
                                ).expand(),
                              ],
                            ).paddingAll(16)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ];
          },
          body: newestProducts.isNotEmpty
              ? SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: height * 0.55,
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: <Widget>[
                              PageView.builder(
                                    controller: _pageController,

                                itemCount: banners.length,
                                itemBuilder: (context, index) {
                                  return Image.asset(banners[index],
                                      width: width,
                                      height: height * 0.55,
                                      fit: BoxFit.cover);
                                },
                                onPageChanged: (index) {
                                  setState(() {
                                    position = index;
                                  });
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: DotsIndicator(
                                  dotsCount: banners.length,
                                  position: 0,
                                  decorator: const DotsDecorator(
                                    color: viewcolor,
                                    activeColor: primaryColor,
                                    size: Size.square(7.0),
                                    activeSize: Size.square(10.0),
                                    spacing: EdgeInsets.all(3),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 80,
                          margin:
                              const EdgeInsets.only(top: spacingstandardnew),
                          alignment: Alignment.topLeft,
                          child: ListView.builder(
                            itemCount: list.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.only(
                                left: spacingstandard,
                                right: spacingstandard),
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                margin: const EdgeInsets.only(
                                    left: spacingstandard,
                                    right: spacingstandard),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      padding:
                                          const EdgeInsets.all(spacingmiddle),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: colors[index % colors.length]),
                                      child: Image.asset(list[index].image!,
                                          width: 25, color: white),
                                    ),
                                    const SizedBox(height: spacingcontrol),
                                    text(list[index].name,
                                        textColor:
                                            colors[index % colors.length],
                                        fontFamily: fontMedium)
                                  ],
                                ),
                              ).onTap(() {
                                // SubCategory(category: list[index])
                                    // .launch(context);
                              });
                            },
                          ),
                        ),
                        horizontalHeading(lbl_newestProduct, callback: () {
                          // ViewAllProductscreen(
                          //         prodcuts: newestProducts,
                          //         title: lbl_newestProduct)
                          //     .launch(context);
                        }),
                        ProductHorizontalList(newestProducts),
                        const SizedBox(height: spacingstandardnew),
                        horizontalHeading(lbl_Featured, callback: () {
                          // ViewAllProductscreen(
                          //         prodcuts: featuredProducts,
                          //         title: lbl_Featured)
                          //     .launch(context);
                        },
                        ),
                        ProductHorizontalList(featuredProducts),
                        const SizedBox(height: 60),
                      ],
                    ),
                  ),
                )
              : Container(),
        ),
      ),
    );
  }
}
