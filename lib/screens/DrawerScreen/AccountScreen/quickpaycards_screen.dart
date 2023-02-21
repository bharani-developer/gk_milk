import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gk_milk/widgets/appbar.dart';
import 'package:nb_utils/nb_utils.dart';

import 'package:gk_milk/models/paymentcard_model.dart';
import 'package:gk_milk/utils/colors.dart';
import 'package:gk_milk/utils/constants.dart';
import 'package:gk_milk/utils/image.dart';
import 'package:gk_milk/utils/strings.dart';
import 'package:gk_milk/widgets/widgets.dart';
import 'package:gk_milk/screens/DrawerScreen/AccountScreen/addcard_screen.dart';

class QuickPayCardsScreen extends StatefulWidget {
  static String tag = '/QuickPayCardsScreen';

  const QuickPayCardsScreen({super.key});

  @override
  QuickPayCardsScreenState createState() => QuickPayCardsScreenState();
}

class QuickPayCardsScreenState extends State<QuickPayCardsScreen> {
  List<ShPaymentCard> list = [];
  int? selectedCard = 0;

  editCard(ShPaymentCard card) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => AddCardScreen(
                  paymentCard: card,
                )));
  }

  deleteCard(ShPaymentCard card) {
    setState(() {
      list.remove(card);
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      list.add(ShPaymentCard());
      list.add(ShPaymentCard());
      list.add(ShPaymentCard());
      list.add(ShPaymentCard());
      list.add(ShPaymentCard());
      list.add(ShPaymentCard());
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    width = width - 50;
    final listView = ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.only(
          top: spacingstandardnew, bottom: spacingstandardnew),
      itemBuilder: (item, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: spacingstandardnew),
          child: Slidable(
            actionPane: const SlidableDrawerActionPane(),
            actions: <Widget>[
              IconSlideAction(
                caption: 'Edit',
                color: Colors.green,
                icon: Icons.edit,
                onTap: () => editCard(list[index]),
              )
            ],
            secondaryActions: <Widget>[
              IconSlideAction(
                caption: 'Delete',
                color: Colors.redAccent,
                icon: Icons.delete_outline,
                onTap: () => deleteCard(list[index]),
              ),
            ],
            child: InkWell(
              onTap: () {
                setState(() {
                  selectedCard = index;
                });
              },
              child: Container(
                margin: const EdgeInsets.only(
                  right: spacingstandardnew,
                  left: spacingstandardnew,
                ),
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: <Widget>[
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 210,
                      child: Stack(
                        children: <Widget>[
                          Image.asset(
                            ic_card,
                            fit: BoxFit.fill,
                            width: MediaQuery.of(context).size.width,
                            height: 210,
                          ),
                          Padding(
                              padding: const EdgeInsets.all(14),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Image.asset(chip,
                                            width: 50,
                                            height: 30,
                                            fit: BoxFit.fill),
                                        16.height,
                                        text(
                                          "3434 3434 3434",
                                          textColor: white,
                                          fontFamily: fontMedium,
                                          fontSize: textSizeLargeMedium,
                                        ),
                                        text("valid 12/12",
                                            textColor: white,
                                            fontSize: textSizeSMedium),
                                        8.height,
                                        text("JOHN",
                                            textColor: white,
                                            fontFamily: fontMedium,
                                            fontSize: textSizeMedium),
                                      ],
                                    ),
                                  )
                                ],
                              )),
                        ],
                      ),
                    ),
                    Radio(
                        value: index,
                        groupValue: selectedCard,
                        onChanged: (dynamic value) {
                          setState(() {
                            selectedCard = value;
                          });
                        },
                        activeColor: white)
                  ],
                ),
              ),
            ),
          ),
        );
      },
      shrinkWrap: true,
      itemCount: list.length,
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
            listView
          ],
        ),
      ),
    );
  }
}
