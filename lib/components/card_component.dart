import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import 'package:gk_milk/models/card_model.dart';
// import 'package:gk_milk/screens/TabScreen/SubscriptionScreen/sendmoney_screen.dart';

class WACardComponent extends StatefulWidget {
  static String tag = '/WACardComponent';
  final CardModel? cardModel;

  const WACardComponent({super.key, this.cardModel});

  @override
  WACardComponentState createState() => WACardComponentState();
}

class WACardComponentState extends State<WACardComponent> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 30, top: 8),
      decoration: boxDecorationRoundedWithShadow(
        30,
        backgroundColor: widget.cardModel!.color!,
        blurRadius: 10.0,
        spreadRadius: 4.0,
        shadowColor: widget.cardModel!.color!.withAlpha(50),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Align(
            alignment: Alignment.topRight,
            child: ImageIcon(
              AssetImage('assets/icons/milk_bottle.png'),
              size: 50,
              color: Colors.white,
            ),
          ),
          Text('Milk', style: secondaryTextStyle(color: Colors.white60)),
          4.height,
          Text(widget.cardModel!.period!,
              style: boldTextStyle(color: Colors.white, size: 15)),
          4.height,
          Text(widget.cardModel!.balance!,
              style: boldTextStyle(color: Colors.white, size: 15)),
          10.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.cardModel!.cardNumber!,
                  style: primaryTextStyle(color: Colors.white70)),
              Text(widget.cardModel!.date!,
                  style: primaryTextStyle(color: Colors.white70)),
            ],
          ),
        ],
      ),
    ).onTap(() {
      // const SendMoneyScreen().launch(context);
    });
  }
}
