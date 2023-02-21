import 'package:flutter/material.dart';
import 'package:gk_milk/widgets/appbar.dart';
import 'package:nb_utils/nb_utils.dart';


import 'package:gk_milk/models/paymentcard_model.dart';

import 'package:gk_milk/utils/colors.dart';
import 'package:gk_milk/utils/constants.dart';
import 'package:gk_milk/utils/strings.dart';
import 'package:gk_milk/widgets/widgets.dart';

// ignore: must_be_immutable
class AddCardScreen extends StatefulWidget {
  static String tag = '/AddCardScreen';
  ShPaymentCard? paymentCard;

  AddCardScreen({super.key, this.paymentCard});

  @override
  AddCardScreenState createState() => AddCardScreenState();
}

class AddCardScreenState extends State<AddCardScreen> {
  var cvvCont = TextEditingController();
  var nameCont = TextEditingController();
  var cardNumberCont = TextEditingController();
  var months = [
    "",
    "01",
    "02",
    "03",
    "04",
    "05",
    "06",
    "07",
    "08",
    "09",
    "10",
    "11",
    "12"
  ];
  var years = [
    "",
    "2020",
    "2021",
    "2022",
    "2023",
    "2024",
    "2025",
    "2026",
    "2027",
    "2028",
    "2029",
    "2030",
    "2031"
  ];
  String? selectedMonth = "";
  String? selectedYear = "";

  @override
  void initState() {
    super.initState();
    if (widget.paymentCard != null) {
      setState(() {
        cvvCont.text = widget.paymentCard!.cvv;
        nameCont.text = widget.paymentCard!.holderName;
        cardNumberCont.text = widget.paymentCard!.cardNo;
        selectedMonth = widget.paymentCard!.month;
        selectedYear = widget.paymentCard!.year;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
                    appBar: const MyAppBar(tittle: lbl_add_card,),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(spacingstandardnew),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              headingText(hint_card_number),
              16.height,
              TextFormField(
                keyboardType: TextInputType.number,
                autofocus: false,
                maxLength: 16,
                controller: cardNumberCont,
                textCapitalization: TextCapitalization.words,
                style: primaryTextStyle(),
                decoration: const InputDecoration(
                    filled: false,
                    counterText: "",
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    focusedBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(spacingcontrol)),
                        borderSide: BorderSide(color: Colors.grey, width: 1)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(spacingcontrol)),
                        borderSide: BorderSide(color: Colors.grey, width: 0))),
              ),
              16.height,
              Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        headingText("Month"),
                        16.height,
                        Container(
                          width: double.infinity,
                          padding:
                              const EdgeInsets.fromLTRB(20.0, 4.0, 8.0, 4.0),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.grey.withOpacity(0.5),
                                  width: 1),
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(spacingcontrol))),
                          child: DropdownButton<String>(
                            underline: const SizedBox(),
                            value: selectedMonth,
                            isExpanded: true,
                            items: months.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value, style: primaryTextStyle()),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                selectedMonth = newValue;
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: spacingstandardnew,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        headingText("Year"),
                        const SizedBox(
                          height: spacingstandardnew,
                        ),
                        Container(
                          width: double.infinity,
                          padding:
                              const EdgeInsets.fromLTRB(20.0, 4.0, 8.0, 4.0),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.grey.withOpacity(0.5),
                                  width: 1),
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(spacingcontrol))),
                          child: DropdownButton<String>(
                            underline: const SizedBox(),
                            value: selectedYear,
                            isExpanded: true,
                            items: years.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value, style: primaryTextStyle()),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                selectedYear = newValue;
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              16.height,
              headingText(lbl_cvv),
              16.height,
              TextFormField(
                keyboardType: TextInputType.number,
                autofocus: false,
                controller: cvvCont,
                maxLength: 3,
                obscureText: true,
                textCapitalization: TextCapitalization.words,
                style: primaryTextStyle(),
                decoration: const InputDecoration(
                    filled: false,
                    counterText: "",
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    focusedBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(spacingcontrol)),
                        borderSide: BorderSide(color: Colors.grey, width: 1)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(spacingcontrol)),
                        borderSide: BorderSide(color: Colors.grey, width: 0))),
              ),
              16.height,
              headingText(hint_card_holder_name),
              16.height,
              TextFormField(
                keyboardType: TextInputType.text,
                autofocus: false,
                controller: nameCont,
                textCapitalization: TextCapitalization.words,
                style: primaryTextStyle(),
                decoration: const InputDecoration(
                    filled: false,
                    counterText: "",
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    focusedBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(spacingcontrol)),
                        borderSide: BorderSide(color: Colors.grey, width: 1)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(spacingcontrol)),
                        borderSide: BorderSide(color: Colors.grey, width: 0))),
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                // height: double.infinity,
                child: MaterialButton(
                  padding: const EdgeInsets.all(spacingstandard),
                  textColor: white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0)),
                  color: primaryColor,
                  onPressed: () => {},
                  child: text(lbl_add_card,
                      fontSize: textSizeNormal,
                      fontFamily: fontMedium,
                      textColor: white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
