// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:nb_utils/nb_utils.dart';


import 'package:gk_milk/models/address_model.dart';
import 'package:gk_milk/utils/colors.dart' as c;
import 'package:gk_milk/utils/constants.dart';
import 'package:gk_milk/utils/extension.dart';
import 'package:gk_milk/utils/strings.dart';
import 'package:gk_milk/widgets/widgets.dart';
import 'package:gk_milk/utils/colors.dart';

import 'package:gk_milk/screens/DrawerScreen/AccountScreen/addnewaddress_screen.dart';
import 'package:gk_milk/main.dart';

class AddressManagerScreen extends StatefulWidget {
  static String tag = '/AddressManagerScreen';

  const AddressManagerScreen({super.key});

  @override
  AddressManagerScreenState createState() => AddressManagerScreenState();
}

class AddressManagerScreenState extends State<AddressManagerScreen> {
  List<ShAddressModel> addressList = [];
  int? selectedAddressIndex = 0;
  var mIsLoading = true;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    setState(() {
      mIsLoading = true;
    });
    var addresses = await loadAddresses();
    setState(() {
      addressList.clear();
      addressList.addAll(addresses);
      isLoaded = true;
      mIsLoading = false;
    });
  }

  deleteAddress(ShAddressModel model) async {
    setState(() {
      addressList.remove(model);
    });
  }

  editAddress(ShAddressModel model) async {
    var bool = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => AddNewAddressScreen(
                      addressModel: model,
                    ))) ??
        false;
    if (bool) {
      fetchData();
    }
  }

  @override
  Widget build(BuildContext context) {
    final listView = ListView.builder(
      physics: const BouncingScrollPhysics(),
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
                onTap: () => editAddress(addressList[index]),
              )
            ],
            secondaryActions: <Widget>[
              IconSlideAction(
                caption: 'Delete',
                color: Colors.redAccent,
                icon: Icons.delete_outline,
                onTap: () => deleteAddress(addressList[index]),
              ),
            ],
            child: InkWell(
              onTap: () {
                setState(() {
                  selectedAddressIndex = index;
                });
              },
              child: Container(
                padding: const EdgeInsets.all(spacingstandardnew),
                margin: const EdgeInsets.only(
                  right: spacingstandardnew,
                  left: spacingstandardnew,
                ),
                color: context.cardColor,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Radio(
                        value: index,
                        groupValue: selectedAddressIndex,
                        onChanged: (dynamic value) {
                          setState(() {
                            selectedAddressIndex = value;
                          });
                        },
                        activeColor: primaryColor),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                              "${addressList[index].first_name!} ${addressList[index].last_name!}",
                              style: boldTextStyle()),
                          Text(addressList[index].address.toString(),
                              style: primaryTextStyle()),
                          Text(
                              "${addressList[index].city!},${addressList[index].state!}",
                              style: secondaryTextStyle()),
                          Text(
                              "${addressList[index].country!},${addressList[index].pinCode!}",
                              style: secondaryTextStyle()),
                          16.height,
                          Text(addressList[index].phone_number.toString(),
                              style: primaryTextStyle()),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
      shrinkWrap: true,
      itemCount: addressList.length,
    );

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              color: appStore.isDarkModeOn ? white : Colors.black,
              icon: const Icon(Icons.add),
              onPressed: () async {
                var bool = await AddNewAddressScreen().launch(context) ?? false;
                if (bool) {
                  fetchData();
                }
              })
        ],
        actionsIconTheme: IconThemeData(
            color: appStore.isDarkModeOn ? white : c.textColorPrimary),
        iconTheme: IconThemeData(
            color: appStore.isDarkModeOn ? white : c.textColorPrimary),
        title: Text(lbl_address_manager, style: boldTextStyle(size: 18)),
      ),
      body: Stack(
        alignment: Alignment.bottomLeft,
        children: <Widget>[
          listView,
          SizedBox(
            width: double.infinity,
            child: MaterialButton(
              color: primaryColor,
              elevation: 0,
              padding: const EdgeInsets.all(spacingstandardnew),
              child: text("Save",
                  textColor: c.shwhite,
                  fontFamily: fontMedium,
                  fontSize: textSizeLargeMedium),
              onPressed: () {
                Navigator.pop(context, selectedAddressIndex);
              },
            ),
          )
        ],
      ),
    );
  }
}
