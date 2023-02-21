import 'package:flutter/material.dart';
// import 'package:gk_milk/screens/TabScreen/ProductScreen/product_detail.dart';
import 'package:gk_milk/widgets/appbar.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:gk_milk/models/product_model.dart';
// import 'package:gk_milk/screen/ProductScreen/product_detail.dart';
import 'package:gk_milk/utils/colors.dart';
import 'package:gk_milk/utils/constants.dart';
import 'package:gk_milk/utils/extension.dart';
import 'package:gk_milk/utils/strings.dart';
import 'package:gk_milk/widgets/widgets.dart';
import 'package:gk_milk/main.dart';

class OffersScreen extends StatefulWidget {
  static String tag = '/OffersScreen';

  const OffersScreen({super.key});

  @override
  OffersScreenState createState() => OffersScreenState();
}

class OffersScreenState extends State<OffersScreen> {
  List<ShProduct> mProductModel = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    var products = await loadProducts();
    List<ShProduct> offers = [];
    for (var product in products) {
      if (product.on_sale!) {
        offers.add(product);
      }
    }
    setState(() {
      mProductModel.clear();
      mProductModel.addAll(offers);
    });
  }

  @override
  Widget build(BuildContext context) {
    final gridView = GridView.builder(
        itemCount: mProductModel.length,
        shrinkWrap: true,
        padding: const EdgeInsets.all(spacingmiddle),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 9 / 13,
            crossAxisSpacing: spacingmiddle,
            mainAxisSpacing: spacingstandardnew),
        itemBuilder: (_, index) {
          return InkWell(
            onTap: () {
              // ProductDetail(product: mProductModel[index]).launch(context);
            },
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.start,
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 9 / 11,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(1),
                        decoration: BoxDecoration(
                            border: Border.all(color: view_color, width: 0.5)),
                        child: Image.asset(
                          mProductModel[index].images![0].src!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(spacingcontrol),
                        margin: const EdgeInsets.all(spacingstandard),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: context.cardColor),
                        child: Icon(
                          Icons.favorite_border,
                          color:
                              appStore.isDarkModeOn ? white : textColorPrimary,
                          size: 16,
                        ),
                      )
                    ],
                  ),
                ),
                2.height,
                Row(
                  children: <Widget>[
                    text(
                        mProductModel[index].on_sale!
                            ? mProductModel[index]
                                .sale_price
                                .toString()
                                .toCurrencyFormat()
                            : mProductModel[index]
                                .price
                                .toString()
                                .toCurrencyFormat(),
                        textColor: primaryColor,
                        fontFamily: fontMedium,
                        fontSize: textSizeNormal),
                    4.width,
                    Text(
                      mProductModel[index]
                          .regular_price
                          .toString()
                          .toCurrencyFormat()!,
                      style: const TextStyle(
                          color: textColorSecondary,
                          fontFamily: fontRegular,
                          fontSize: textSizeSMedium,
                          decoration: TextDecoration.lineThrough),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
    return Scaffold(
      appBar: const MyAppBar(
        tittle: lbl_my_offers,
      ),
      body: gridView,
    );
  }
}
