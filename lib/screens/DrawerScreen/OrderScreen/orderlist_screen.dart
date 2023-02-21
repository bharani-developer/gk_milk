import 'package:flutter/material.dart';
import 'package:gk_milk/widgets/appbar.dart';
import 'package:nb_utils/nb_utils.dart';


import 'package:gk_milk/models/order_model.dart';

import 'package:gk_milk/utils/colors.dart';
import 'package:gk_milk/utils/constants.dart';
import 'package:gk_milk/utils/extension.dart';
import 'package:gk_milk/utils/strings.dart';
import 'package:gk_milk/widgets/widgets.dart';

import 'package:gk_milk/screens/DrawerScreen/OrderScreen/orderdetail_screen.dart';

class OrderListScreen extends StatefulWidget {
  static String tag = '/OrderListScreen';

  const OrderListScreen({super.key});

  @override
  OrderListScreenState createState() => OrderListScreenState();
}

class OrderListScreenState extends State<OrderListScreen> {
  List<Order> list = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    var orders = await loadOrders();
    setState(() {
      list.clear();
      list.addAll(orders);
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var listView = ListView.builder(
      itemCount: list.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.all(10.0),
          color: context.cardColor,
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: view_color, width: 1)),
                  child: Image.asset(
                    list[index].item!.image!,
                    fit: BoxFit.cover,
                    height: width * 0.35,
                    width: width * 0.29,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(list[index].item!.name!, style: boldTextStyle()),
                      4.height,
                      text(
                        list[index].item!.price.toString().toCurrencyFormat(),
                        textColor: colorPrimary,
                        fontFamily: fontMedium,
                        fontSize: textSizeNormal,
                      ),
                      8.height,
                      Expanded(
                        child: IntrinsicHeight(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Container(
                                    width: spacingstandard,
                                    height: spacingstandard,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.yellow),
                                  ),
                                  const VerticalDivider(color: Colors.grey)
                                      .expand(),
                                  Container(
                                    width: spacingstandard,
                                    height: spacingstandard,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.grey),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      "${list[index].order_date!}\n Order Placed",
                                      maxLines: 2,
                                      style: primaryTextStyle(size: 14),
                                    ),
                                    Text(list[index].order_status!,
                                        style: secondaryTextStyle()),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ).onTap(() {
          OrderDetailScreen(order: list[index]).launch(context);
        });
      },
    );
    return Scaffold(
                          appBar: const MyAppBar(tittle: lbl_myOrders,),

      body: SizedBox(width: width, child: listView),
    );
  }
}
