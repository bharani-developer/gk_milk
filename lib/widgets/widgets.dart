// ignore_for_file: non_constant_identifier_names, must_be_immutable, prefer_typing_uninitialized_variables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gk_milk/models/product_model.dart';
// import 'package:gk_milk/screens/CartScreen/cart_screen.dart';
// import 'package:gk_milk/screens/TabScreen/ProductScreen/product_detail.dart';
import 'package:gk_milk/utils/image.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:gk_milk/main.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:gk_milk/model/product.dart';
// import 'package:gk_milk/screen/ProductScreen/product_detail.dart';
import 'package:gk_milk/utils/colors.dart';
import 'package:gk_milk/utils/extension.dart';
// import 'package:gk_milk/utils/image.dart';

import 'package:gk_milk/utils/constants.dart';
import 'package:gk_milk/utils/strings.dart';

InputDecoration waInputDecoration(
    {IconData? prefixIcon,
    String? hint,
    Color? bgColor,
    Color? borderColor,
    EdgeInsets? padding}) {
  return InputDecoration(
    contentPadding:
        padding ?? const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
    counter: const Offstage(),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: borderColor ?? primaryColor)),
    enabledBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      borderSide: BorderSide(color: Colors.grey.withOpacity(0.2)),
    ),
    fillColor: bgColor ?? primaryColor.withOpacity(0.04),
    hintText: hint,
    prefixIcon:
        prefixIcon != null ? Icon(prefixIcon, color: primaryColor) : null,
    hintStyle: secondaryTextStyle(),
    filled: true,
  );
}

Widget CommonCachedNetworkImage(
  String? url, {
  double? height,
  double? width,
  BoxFit? fit,
  AlignmentGeometry? alignment,
  bool usePlaceholderIfUrlEmpty = true,
  double? radius,
  Color? color,
}) {
  if (url!.validate().isEmpty) {
    return placeHolderWidget(
        height: height,
        width: width,
        fit: fit,
        alignment: alignment,
        radius: radius);
  } else if (url.validate().startsWith('http')) {
    return CachedNetworkImage(
      imageUrl: url,
      height: height,
      width: width,
      fit: fit,
      color: color,
      alignment: alignment as Alignment? ?? Alignment.center,
      errorWidget: (_, s, d) {
        return placeHolderWidget(
            height: height,
            width: width,
            fit: fit,
            alignment: alignment,
            radius: radius);
      },
      placeholder: (_, s) {
        if (!usePlaceholderIfUrlEmpty) return const SizedBox();
        return placeHolderWidget(
            height: height,
            width: width,
            fit: fit,
            alignment: alignment,
            radius: radius);
      },
    );
  } else {
    return Image.asset(url,
            height: height,
            width: width,
            fit: fit,
            alignment: alignment ?? Alignment.center)
        .cornerRadiusWithClipRRect(radius ?? defaultRadius);
  }
}

Widget placeHolderWidget(
    {double? height,
    double? width,
    BoxFit? fit,
    AlignmentGeometry? alignment,
    double? radius}) {
  return Image.asset('assets/images/placeholder/placeholder.jpg',
          height: height,
          width: width,
          fit: fit ?? BoxFit.cover,
          alignment: alignment ?? Alignment.center)
      .cornerRadiusWithClipRRect(radius ?? defaultRadius);
}

InputDecoration formFieldDecoration(String hintText) {
  return InputDecoration(
    labelText: hintText,
    focusColor: primaryColor,
    counterText: "",
    labelStyle: primaryTextStyle(),
    contentPadding: const EdgeInsets.only(bottom: 2.0),
  );
}

class ProductHorizontalList extends StatelessWidget {
  List<ShProduct> list = [];
  var isHorizontal = false;

  ProductHorizontalList(this.list, {super.key, this.isHorizontal = false});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Container(
      height: 250,
      margin: const EdgeInsets.only(top: spacingstandardnew),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: list.length,
          shrinkWrap: true,
          padding: const EdgeInsets.only(right: spacingstandardnew),
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(left: spacingstandardnew),
              width: width * 0.4,
              child: InkWell(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) =>
                  //             ProductDetail(product: list[index])));
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image.asset(list[index].images![0].src!,
                        width: double.infinity, height: 200, fit: BoxFit.cover),
                    const SizedBox(height: spacingstandard),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(list[index].name!,
                                  maxLines: 2, style: boldTextStyle())
                              .expand(),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                list[index]
                                    .regular_price
                                    .toString()
                                    .toCurrencyFormat()!,
                                style: secondaryTextStyle(),
                              ),
                              const SizedBox(width: spacingcontrolhalf),
                              text(
                                list[index].on_sale!
                                    ? list[index]
                                        .sale_price
                                        .toString()
                                        .toCurrencyFormat()
                                    : list[index]
                                        .price
                                        .toString()
                                        .toCurrencyFormat(),
                                textColor: colorPrimary,
                                fontFamily: fontMedium,
                                fontSize: textSizeMedium,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}

Widget divider() {
  return const Divider(
    height: 0.5,
    color: view_color,
  );
}

Widget horizontalHeading(var title, {bool showViewAll = true, var callback}) {
  return Padding(
    padding: const EdgeInsets.only(
      left: spacingstandardnew,
      right: spacingstandardnew,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(title, style: boldTextStyle()),
        showViewAll
            ? GestureDetector(
                onTap: callback,
                child: Container(
                  padding: const EdgeInsets.only(
                      left: spacingstandardnew,
                      top: spacingcontrol,
                      bottom: spacingcontrol),
                  child: Text(lbl_view_all,
                      style: boldTextStyle(color: textColorSecondary)),
                ),
              )
            : Container()
      ],
    ),
  );
}

// List<Widget> colorWidget(List<Attribute> attributes) {
//   var maxWidget = 6;
//   var currentIndex = 0;
//   var color;
//   List<Widget> list = [];

//   for (var attribute in attributes) {
//     if (attribute.name == "Color") {
//       color = attribute.options;
//     }
//   }
//   if (color != null) {
//     var totalColors = color.length;
//     var flag = false;
//     color.forEach((color) {
//       if (currentIndex < maxWidget) {
//         list.add(Container(
//           padding: const EdgeInsets.all(6),
//           margin: const EdgeInsets.only(right: spacing_middle),
//           decoration: BoxDecoration(
//               shape: BoxShape.rectangle,
//               border: Border.all(color: textColorPrimary, width: 0.5),
//               color: getColorFromHex(color)),
//         ));
//         currentIndex++;
//       } else {
//         if (!flag) list.add(Text('+ ${totalColors - maxWidget} more'));
//         flag = true;
//         return;
//       }
//     });
//   }

//   return list;
// }

Widget cartIcon(context, cartCount) {
  return InkWell(
    onTap: () {
      // const CartScreen().launch(context);
    },
    radius: spacingstandardnew,
    child: Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          width: 40,
          height: 40,
          margin: const EdgeInsets.only(right: spacingstandardnew),
          padding: const EdgeInsets.all(spacingstandard),
          child: SvgPicture.asset(ic_cart,
              color: appStore.isDarkModeOn ? white : black),
        ),
        cartCount > 0
            ? Align(
                alignment: Alignment.topRight,
                child: Container(
                  margin: const EdgeInsets.only(top: spacingcontrol),
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.red),
                  child: text(cartCount.toString(),
                      textColor: white, fontSize: textSizeSmall),
                ),
              )
            : Container()
      ],
    ),
  );
}

Widget headingText(String content) {
  return Text(content, style: primaryTextStyle());
}

Widget text(
  String? text, {
  var fontSize = textSizeLargeMedium,
  Color? textColor,
  var fontFamily,
  var isCentered = false,
  var maxLine = 1,
  var latterSpacing = 0.5,
  bool textAllCaps = false,
  var isLongText = false,
  bool lineThrough = false,
}) {
  return Text(
    textAllCaps ? text!.toUpperCase() : text!,
    textAlign: isCentered ? TextAlign.center : TextAlign.start,
    maxLines: isLongText ? null : maxLine,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize,
      color: textColor ?? appStore.textSecondaryColor,
      height: 1.5,
      letterSpacing: latterSpacing,
      decoration:
          lineThrough ? TextDecoration.lineThrough : TextDecoration.none,
    ),
  );
}

void changeStatusColor(Color color) async {
  setStatusBarColor(color);
}

BoxDecoration boxDecoration(
    {double radius = 2,
    Color color = Colors.transparent,
    Color? bgColor,
    var showShadow = false}) {
  return BoxDecoration(
    color: bgColor ?? appStore.scaffoldBackground,
    boxShadow: showShadow
        ? defaultBoxShadow(shadowColor: shadowColorGlobal)
        : [const BoxShadow(color: Colors.transparent)],
    border: Border.all(color: color),
    borderRadius: BorderRadius.all(Radius.circular(radius)),
  );
}
InputDecoration AddressInputDecoration(
    {IconData? prefixIcon,
    String? hint,
    Color? bgColor,
    Color? borderColor,
    EdgeInsets? padding}) {
  return InputDecoration(
    contentPadding:
        padding ?? const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
    counter: const Offstage(),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: borderColor ?? primaryColor)),
    enabledBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      borderSide: BorderSide(color: Colors.grey.withOpacity(0.2)),
    ),
    fillColor: bgColor ?? primaryColor.withOpacity(0.04),
    hintText: hint,
    prefixIcon:
        prefixIcon != null ? Icon(prefixIcon, color: primaryColor) : null,
    hintStyle: secondaryTextStyle(),
    filled: true,
  );
}
