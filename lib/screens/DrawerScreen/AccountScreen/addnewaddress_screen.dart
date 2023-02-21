// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';


import 'package:gk_milk/models/address_model.dart';

import 'package:gk_milk/utils/colors.dart';
import 'package:gk_milk/utils/constants.dart';
import 'package:gk_milk/utils/strings.dart';
import 'package:gk_milk/widgets/widgets.dart';

import 'package:gk_milk/main.dart';

class AddNewAddressScreen extends StatefulWidget {
  static String tag = '/AddNewAddress';
  ShAddressModel? addressModel;

  AddNewAddressScreen({super.key, this.addressModel});

  @override
  AddNewAddressScreenState createState() => AddNewAddressScreenState();
}

class AddNewAddressScreenState extends State<AddNewAddressScreen> {
   String? _currentAddress;
  Position? _currentPosition;

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() => _currentPosition = position);
      _getAddressFromLatLng(_currentPosition!);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
            _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        _currentAddress =
            '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }


  var firstNameCont = TextEditingController();
  var lastNameCont = TextEditingController();
  var pinCodeCont = TextEditingController();
  var cityCont = TextEditingController();
  var stateCont = TextEditingController();
  var addressCont = TextEditingController();
  var phoneNumberCont = TextEditingController();
  var countryCont = TextEditingController();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    if (widget.addressModel != null) {
      pinCodeCont.text = widget.addressModel!.pinCode!;
      addressCont.text = widget.addressModel!.address!;
      cityCont.text = widget.addressModel!.city!;
      stateCont.text = widget.addressModel!.state!;
      countryCont.text = widget.addressModel!.country!;
      firstNameCont.text = widget.addressModel!.first_name!;
      lastNameCont.text = widget.addressModel!.last_name!;
      phoneNumberCont.text = widget.addressModel!.phone_number!;
    }
  }

  @override
  Widget build(BuildContext context) {
    void onSaveClicked() async {
      Navigator.pop(context, true);
    }
/*    getLocation() async {
      Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high).then((position) {
        var coordinates = Coordinates(position.latitude, position.longitude);
        Geocoder.local.findAddressesFromCoordinates(coordinates).then((addresses) {
          var first = addresses.first;
          print("${addresses} : ${first.addressLine}");
          setState(() {
            pinCodeCont.text = first.postalCode;
            addressCont.text = first.addressLine;
            cityCont.text = first.locality;
            stateCont.text = first.adminArea;
            countryCont.text = first.countryName;
          });
        }).catchError((error) {
          print(error);
        });
      }).catchError((error) {
        print(error);
      });
    }*/

    final useCurrentLocation = Container(
      alignment: Alignment.center,
      child: MaterialButton(
        color: appStore.isDarkModeOn ? cardDarkColor : lightgray,
        elevation: 0,
        padding:
            const EdgeInsets.only(top: spacingmiddle, bottom: spacingmiddle),
        onPressed: () => {
          //getLocation()
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
         Text('LAT: ${_currentPosition?.latitude ?? ""}'),
              Text('LNG: ${_currentPosition?.longitude ?? ""}'),
              Text('ADDRESS: ${_currentAddress ?? ""}'),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: _getCurrentPosition,
                child: const Text("Get Current Location"),
              ),
          ],
        ),
      ),
    );

    final firstName = TextFormField(
      controller: firstNameCont,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      textCapitalization: TextCapitalization.words,
      style: primaryTextStyle(),
      autofocus: false,
      onFieldSubmitted: (term) {
        FocusScope.of(context).nextFocus();
      },
      decoration: formFieldDecoration(hint_first_name),
    );

    final lastName = TextFormField(
      controller: lastNameCont,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      textCapitalization: TextCapitalization.words,
      style: primaryTextStyle(),
      autofocus: false,
      onFieldSubmitted: (term) {
        FocusScope.of(context).nextFocus();
      },
      decoration: formFieldDecoration(hint_last_name),
    );

    final pinCode = TextFormField(
      controller: pinCodeCont,
      keyboardType: TextInputType.number,
      maxLength: 6,
      autofocus: false,
      onFieldSubmitted: (term) {
        FocusScope.of(context).nextFocus();
      },
      textInputAction: TextInputAction.next,
      style: primaryTextStyle(),
      decoration: formFieldDecoration(hint_pin_code),
    );

    final city = TextFormField(
      controller: cityCont,
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.words,
      style: primaryTextStyle(),
      onFieldSubmitted: (term) {
        FocusScope.of(context).nextFocus();
      },
      textInputAction: TextInputAction.next,
      autofocus: false,
      decoration: formFieldDecoration(hint_city),
    );

    final state = TextFormField(
      onFieldSubmitted: (term) {
        FocusScope.of(context).nextFocus();
      },
      controller: stateCont,
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.words,
      style: primaryTextStyle(),
      autofocus: false,
      textInputAction: TextInputAction.next,
      decoration: formFieldDecoration(hint_state),
    );

    final country = TextFormField(
      onFieldSubmitted: (term) {
        FocusScope.of(context).nextFocus();
      },
      controller: countryCont,
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.words,
      style: primaryTextStyle(),
      autofocus: false,
      textInputAction: TextInputAction.next,
      decoration: formFieldDecoration("Country"),
    );

    final address = TextFormField(
      controller: addressCont,
      keyboardType: TextInputType.multiline,
      maxLines: 4,
      onFieldSubmitted: (term) {
        FocusScope.of(context).nextFocus();
      },
      autofocus: false,
      style: primaryTextStyle(),
      decoration: formFieldDecoration(hint_address),
    );

    final phoneNumber = TextFormField(
      controller: phoneNumberCont,
      keyboardType: TextInputType.phone,
      textInputAction: TextInputAction.done,
      maxLength: 10,
      autofocus: false,
      decoration: formFieldDecoration(hint_contact),
    );

    final saveButton = MaterialButton(
      height: 50,
      minWidth: double.infinity,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
      onPressed: () {
        if (firstNameCont.text.isEmpty) {
          toasty(context, "First name required");
        } else if (lastNameCont.text.isEmpty) {
          toasty(context, "Last name required");
        } else if (phoneNumberCont.text.isEmpty) {
          toasty(context, "Phone Number required");
        } else if (addressCont.text.isEmpty) {
          toasty(context, "Address required");
        } else if (cityCont.text.isEmpty) {
          toasty(context, "City name required");
        } else if (stateCont.text.isEmpty) {
          toasty(context, "State name required");
        } else if (countryCont.text.isEmpty) {
          toasty(context, "Country name required");
        } else if (pinCodeCont.text.isEmpty) {
          toasty(context, "Pincode required");
        } else {
          onSaveClicked();
        }
      },
      color: primaryColor,
      child: text(lbl_save_address,
          fontFamily: fontMedium,
          fontSize: textSizeLargeMedium,
          textColor: shwhite),
    );

    final body = Wrap(runSpacing: spacingstandardnew, children: <Widget>[
      useCurrentLocation,
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(child: firstName),
          const SizedBox(
            width: spacingstandardnew,
          ),
          Expanded(child: lastName),
        ],
      ),
      phoneNumber,
      address,
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(child: city),
          const SizedBox(
            width: spacingstandardnew,
          ),
          Expanded(child: state),
        ],
      ),
      Row(
        children: <Widget>[
          Expanded(child: country),
          const SizedBox(
            width: spacingstandardnew,
          ),
          Expanded(child: pinCode),
        ],
      ),
      Padding(
        padding: const EdgeInsets.only(top: 30.0, bottom: 30.0),
        child: saveButton,
      ),
    ]);

    return Scaffold(
      appBar: AppBar(
        title: Text(
            widget.addressModel == null
                ? lbl_add_new_address
                : lbl_edit_address,
            style: boldTextStyle()),
        iconTheme: IconThemeData(
            color: appStore.isDarkModeOn ? white : textColorPrimary),
        actionsIconTheme: IconThemeData(
            color: appStore.isDarkModeOn ? white : primaryColor),
        actions: [
          cartIcon(context, 3),
        ],
      ),
      body: Container(
          width: double.infinity,
          margin: const EdgeInsets.all(16),
          child: SingleChildScrollView(child: body)),
    );
  }
}
