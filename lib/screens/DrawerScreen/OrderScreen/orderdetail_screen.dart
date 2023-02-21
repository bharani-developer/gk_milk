import 'package:flutter/material.dart';
import 'package:gk_milk/widgets/appbar.dart';
import 'package:nb_utils/nb_utils.dart';


import 'package:gk_milk/models/order_model.dart';
import 'package:gk_milk/utils/colors.dart';
import 'package:gk_milk/utils/constants.dart';
import 'package:gk_milk/utils/extension.dart';
import 'package:gk_milk/utils/strings.dart';
import 'package:gk_milk/widgets/widgets.dart';

// ignore: must_be_immutable
class OrderDetailScreen extends StatefulWidget {
  static String tag = '/OrderDetailScreen';
  Order? order;

  OrderDetailScreen({super.key, this.order});

  @override
  OrderDetailScreenState createState() => OrderDetailScreenState();
}

class OrderDetailScreenState extends State<OrderDetailScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    var item = Container(
      color: context.cardColor,
      margin: const EdgeInsets.only(
          left: spacingstandardnew,
          right: spacingstandardnew,
          top: spacingstandardnew),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset(
              widget.order!.item!.image!,
              width: width * 0.3,
              height: width * 0.35,
              fit: BoxFit.fill,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        8.height,
                        Text(widget.order!.item!.name.toString(),
                                style: boldTextStyle())
                            .paddingOnly(left: 16.0),
                        Row(
                          children: <Widget>[
                            Container(
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.black),
                              padding:
                                  const EdgeInsets.all(spacingcontrolhalf),
                              child: const Icon(Icons.done,
                                  color: white, size: 16),
                            ),
                            16.width,
                            Text("M", style: boldTextStyle()),
                          ],
                        ).paddingOnly(left: 16.0, top: spacingcontrol),
                        text("Total item- 1")
                            .paddingOnly(left: 16.0, top: 4.0, bottom: 4.0),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            text(
                                widget.order!.item!.price
                                    .toString()
                                    .toCurrencyFormat(),
                                textColor: colorPrimary,
                                fontSize: textSizeNormal,
                                fontFamily: fontMedium),
                            4.width,
                            Text(
                              "0".toString().toCurrencyFormat()!,
                              style: const TextStyle(
                                  color: textColorSecondary,
                                  fontFamily: fontRegular,
                                  fontSize: textSizeSMedium,
                                  decoration: TextDecoration.lineThrough),
                            ).paddingOnly(bottom: 4.0),
                          ],
                        ).paddingOnly(left: 16.0),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
    var orderStatus = Container(
      height: width * 0.32,
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.all(16.0),
      decoration:
          BoxDecoration(border: Border.all(color: view_color, width: 1.0)),
      child: IntrinsicHeight(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 4.0),
                  width: 10.0,
                  height: 10.0,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.amber),
                ),
                const VerticalDivider(color: Colors.grey).expand(),
                Container(
                  margin: const EdgeInsets.only(bottom: 4.0),
                  width: 10.0,
                  height: 10.0,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.grey),
                ),
              ],
            ),
            16.width,
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text("${widget.order!.order_date!}\n Order Placed",
                      maxLines: 2, style: primaryTextStyle()),
                  Text("Order Pending", style: primaryTextStyle()),
                ],
              ),
            )
          ],
        ),
      ),
    );
    var paymentDetail = Container(
      margin: const EdgeInsets.only(
          left: spacingstandardnew,
          right: spacingstandardnew,
          top: spacingstandardnew),
      decoration:
          BoxDecoration(border: Border.all(color: view_color, width: 1.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(lbl_payment_details, style: boldTextStyle())
              .paddingSymmetric(horizontal: 16, vertical: 8),
          const Divider(height: 1, color: view_color),
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
    var shippingDetail = Container(
      margin: const EdgeInsets.only(
          left: spacingstandardnew, right: spacingstandardnew),
      decoration:
          BoxDecoration(border: Border.all(color: view_color, width: 1.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(spacingstandardnew,
                spacingmiddle, spacingstandardnew, spacingmiddle),
            child: Text(lbl_shipping_details, style: boldTextStyle()),
          ),
          const Divider(height: 1, color: view_color),
          Padding(
            padding: const EdgeInsets.fromLTRB(spacingstandardnew,
                spacingmiddle, spacingstandardnew, spacingmiddle),
            child: Column(
              children: [
                Row(
                  children: [
                    text(lbl_order_id),
                    Text(widget.order!.order_number.toString(),
                        style: primaryTextStyle()),
                  ],
                ),
                8.height,
                Row(
                  children: [
                    text(lbl_order_date),
                    Text(widget.order!.order_date.toString(),
                        style: primaryTextStyle()),
                  ],
                ),
                8.height,
                Row(
                  children: [
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
                    appBar: const MyAppBar(tittle: lbl_myOrders,),

 
      body: SingleChildScrollView(
        child: Column(
          children: [
            item,
            orderStatus,
            shippingDetail,
            paymentDetail,
            40.height,
          ],
        ),
      ),
    );
  }
}
