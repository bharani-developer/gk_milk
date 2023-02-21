// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:gk_milk/main.dart';

import 'package:gk_milk/utils/colors.dart';
import 'package:gk_milk/utils/data_provider.dart';
import 'package:gk_milk/utils/image.dart';
import 'package:gk_milk/widgets/widgets.dart';

class AddProfileScreen extends StatefulWidget {
  static String tag = '/AddProfileScreen';
  final isEditProfile;

  const AddProfileScreen({super.key, this.isEditProfile});

  @override
  AddProfileScreenState createState() => AddProfileScreenState();
}

class AddProfileScreenState extends State<AddProfileScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  // on below line we have specified camera position
  static const CameraPosition _kGoogle = CameraPosition(
    target: LatLng(20.42796133580664, 80.885749655962),
    zoom: 14.4746,
  );

  // on below line we have created the list of markers
  final List<Marker> _markers = <Marker>[
    const Marker(
        markerId: MarkerId('1'),
        position: LatLng(20.42796133580664, 75.885749655962),
        infoWindow: InfoWindow(
          title: 'My Position',
        )),
  ];

  // created method for getting user current location
  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) async {
      await Geolocator.requestPermission();
      print("ERROR$error");
    });
    return await Geolocator.getCurrentPosition();
  }

  var fullNameController = TextEditingController();
  var contactNumberController = TextEditingController();
  var landmarkController = TextEditingController();
  var areaNameController = TextEditingController();
  var districtNameController = TextEditingController();
  var doorNoController = TextEditingController();

  FocusNode fullNameFocusNode = FocusNode();
  FocusNode contactNumberFocusNode = FocusNode();
  FocusNode landmarkFocusNode = FocusNode();
  FocusNode areaNameFocusNode = FocusNode();
  FocusNode districtNameFocusNode = FocusNode();
  FocusNode doorNoFocusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    setStatusBarColor(Colors.white, statusBarIconBrightness: Brightness.dark);
  }

  @override
  void dispose() {
    setStatusBarColor(Colors.white, statusBarIconBrightness: Brightness.dark);
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  late GoogleMapController mapController; //contrller for Google map
  final Set<Marker> markers = {}; //markers for google map
  static const LatLng showLocation = LatLng(11.0168445, 76.9558321);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            'Add Profile',
            style: boldTextStyle(color: Colors.black, size: 20),
          ),
          leading: Container(
            margin: const EdgeInsets.all(8),
            decoration: boxDecorationWithRoundedCorners(
              backgroundColor: context.cardColor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.withOpacity(0.2)),
            ),
            child: Icon(Icons.arrow_back,
                color: appStore.isDarkModeOn ? white : black),
          ).onTap(() {
            finish(context);
          }),
          centerTitle: true,
          elevation: 0.0,
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        body: Container(
          height: context.height(),
          width: context.width(),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(background), fit: BoxFit.cover)),
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 80),
                padding: const EdgeInsets.only(
                    top: 50, left: 16, right: 16, bottom: 16),
                width: context.width(),
                height: context.height(),
                decoration: boxDecorationWithShadow(
                    backgroundColor: context.cardColor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Personal Information',
                          style: boldTextStyle(size: 18)),
                      16.height,
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                                color: Colors.grey.withOpacity(0.2),
                                width: 0.5)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Full Name', style: boldTextStyle(size: 14)),
                            8.height,
                            AppTextField(
                              decoration: waInputDecoration(
                                hint: 'Enter your full name here',
                              ),
                              textFieldType: TextFieldType.NAME,
                              keyboardType: TextInputType.name,
                              controller: fullNameController,
                              focus: fullNameFocusNode,
                            ),
                            16.height,
                            Text('Contact Number',
                                style: boldTextStyle(size: 14)),
                            8.height,
                            AppTextField(
                              decoration: waInputDecoration(
                                hint: 'Enter your contact number here',
                              ),
                              textFieldType: TextFieldType.PHONE,
                              keyboardType: TextInputType.phone,
                              controller: contactNumberController,
                              focus: contactNumberFocusNode,
                            ),
                            16.height,
                            Text('Date of birth',
                                style: boldTextStyle(size: 14)),
                            8.height,
                            Row(
                              children: [
                                DropdownButtonFormField(
                                  isExpanded: true,
                                  decoration: waInputDecoration(hint: "Date"),
                                  items: List.generate(31, (index) {
                                    return DropdownMenuItem(
                                        value: index + 1,
                                        child: Text('${index + 1}',
                                            style: secondaryTextStyle()));
                                  }),
                                  onChanged: (value) {},
                                ).expand(),
                                16.width,
                                DropdownButtonFormField(
                                  isExpanded: true,
                                  decoration: waInputDecoration(hint: "Month"),
                                  items: monthList.map((String? value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value!,
                                          style: secondaryTextStyle()),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    //
                                  },
                                ).expand(),
                                16.width,
                                DropdownButtonFormField(
                                  isExpanded: true,
                                  decoration: waInputDecoration(hint: "Year"),
                                  items: waYearList.map((String? value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value!,
                                          style: secondaryTextStyle()),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    //
                                  },
                                ).expand(),
                              ],
                            ),
                            16.height,
                            Text('Gender', style: boldTextStyle()),
                            8.height,
                            DropdownButtonFormField(
                              isExpanded: true,
                              decoration:
                                  waInputDecoration(hint: "Select your gender"),
                              items: <String>['Female', 'Male']
                                  .map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child:
                                      Text(value, style: secondaryTextStyle()),
                                );
                              }).toList(),
                              onChanged: (value) {
                                //
                              },
                            ),
                            16.height,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Flexible(
                                  child: Column(
                                    children: [
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text('Door No',
                                              style: boldTextStyle())),
                                      8.height,
                                      AppTextField(
                                        decoration: AddressInputDecoration(
                                          hint: 'Enter door number',
                                        ),
                                        textFieldType: TextFieldType.NAME,
                                        keyboardType: TextInputType.name,
                                        controller: doorNoController,
                                        focus: doorNoFocusNode,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 5.0,
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text('Street Name',
                                              style: boldTextStyle())),
                                      8.height,
                                      AppTextField(
                                        decoration: AddressInputDecoration(
                                          hint: 'Enter street name here',
                                        ),
                                        textFieldType: TextFieldType.NAME,
                                        keyboardType: TextInputType.name,
                                        controller: districtNameController,
                                        focus: districtNameFocusNode,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            16.height,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Flexible(
                                  child: Column(
                                    children: [
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text('Area Name',
                                              style: boldTextStyle())),
                                      8.height,
                                      AppTextField(
                                        decoration: AddressInputDecoration(
                                          hint: 'Enter your area name here',
                                        ),
                                        textFieldType: TextFieldType.NAME,
                                        keyboardType: TextInputType.name,
                                        controller: areaNameController,
                                        focus: areaNameFocusNode,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 5.0,
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text('District Name',
                                              style: boldTextStyle())),
                                      8.height,
                                      DropdownButtonFormField(
                                        isExpanded: true,
                                        decoration: AddressInputDecoration(
                                            hint: "District"),
                                        items: districtList
                                            .map((String? district) {
                                          return DropdownMenuItem<String>(
                                            value: district,
                                            child: Text(district!,
                                                style: secondaryTextStyle()),
                                          );
                                        }).toList(),
                                        onChanged: (value) {
                                          //
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            16.height,
                            Text('State', style: boldTextStyle()),
                            8.height,
                            DropdownButtonFormField(
                              isExpanded: true,
                              decoration:
                                  AddressInputDecoration(hint: "District"),
                              items: stateList.map((String? state) {
                                return DropdownMenuItem<String>(
                                  value: state,
                                  child:
                                      Text(state!, style: secondaryTextStyle()),
                                );
                              }).toList(),
                              onChanged: (value) {
                                //
                              },
                            ),
                            16.height,
                            Text('Landmark', style: boldTextStyle()),
                            8.height,
                            AppTextField(
                              decoration: waInputDecoration(
                                hint: 'Enter your landmark',
                              ),
                              maxLines: 4,
                              textFieldType: TextFieldType.NAME,
                              keyboardType: TextInputType.multiline,
                              controller: landmarkController,
                              focus: landmarkFocusNode,
                            ),
                            16.height,
                            Text('Pin Location', style: boldTextStyle()),
                            8.height,
                            SizedBox(
                              width: double.infinity,
                              height: 200,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: GoogleMap(
                                  // on below line setting camera position
                                  initialCameraPosition: _kGoogle,
                                  // on below line we are setting markers on the map
                                  markers: Set<Marker>.of(_markers),
                                  // on below line specifying map type.
                                  mapType: MapType.normal,
                                  // on below line setting user location enabled.
                                  myLocationEnabled: true,
                                  // on below line setting compass enabled.
                                  compassEnabled: true,
                                  // on below line specifying controller on map complete.
                                  onMapCreated:
                                      (GoogleMapController controller) {
                                    _controller.complete(controller);
                                  },
                                ),
                                // GoogleMap(
                                //   //Map widget from google_maps_flutter package
                                //   zoomGesturesEnabled:
                                //       true, //enable Zoom in, out on map
                                //   initialCameraPosition: const CameraPosition(
                                //     //innital position in map
                                //     target: showLocation, //initial position
                                //     zoom: 15.0, //initial zoom level
                                //   ),
                                //   markers:
                                //       getmarkers(), //markers to show on map
                                //   mapType: MapType.normal, //map type
                                //   onMapCreated: (controller) {
                                //     //method called when map is created
                                //     setState(() {
                                //       mapController = controller;
                                //     }
                                //     );
                                //   },
                                // ),
                              ),
                            ),
                                FloatingActionButton(
        onPressed: () async{
          getUserCurrentLocation().then((value) async {
            print("${value.latitude} ${value.longitude}");
 
            // marker added for current users location
            _markers.add(
                Marker(
                  markerId: const MarkerId("2"),
                  position: LatLng(value.latitude, value.longitude),
                  infoWindow: const InfoWindow(
                    title: 'My Current Location',
                  ),
                )
            );
 
            // specified current users location
            CameraPosition cameraPosition = CameraPosition(
              target: LatLng(value.latitude, value.longitude),
              zoom: 14,
            );
 
            final GoogleMapController controller = await _controller.future;
            controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
            setState(() {
            });
          });
        },
        child: const Icon(Icons.local_activity),
      ),
                          ],
                        ),
                      ),
                      16.height,
                      AppButton(
                        color: primaryColor,
                        width: context.width(),
                        child: Text('Continue',
                            style: boldTextStyle(color: Colors.white)),
                        onTap: () {
                          Navigator.pushNamed(context, '/verificationcreen');

                          if (widget.isEditProfile) {
                            finish(context);
                          } else {
                            Navigator.pushNamed(context, '/verificationcreen');
                          }
                        },
                      ).cornerRadiusWithClipRRect(30).paddingOnly(
                          left: context.width() * 0.1,
                          right: context.width() * 0.1),
                    ],
                  ),
                ),
              ),
              Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 8),
                    height: 110,
                    width: 110,
                    decoration: const BoxDecoration(
                        color: primaryColor, shape: BoxShape.circle),
                    child: const Icon(Icons.person, color: white, size: 60),
                  ),
                  Positioned(
                    bottom: 16,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                          color: accentColor, shape: BoxShape.circle),
                      child:
                          const Icon(Icons.edit, color: Colors.white, size: 20),
                    ),
                  ),
                ],
              ),
            ],
          ).paddingTop(60),
        ),
      ),

      // // on pressing floating action button the camera will take to user current location
  
    );
  }

  Set<Marker> getmarkers() {
    //markers to place on map
    setState(() {
      markers.add(Marker(
        //add first marker
        markerId: MarkerId(showLocation.toString()),
        position: showLocation, //position of marker
        infoWindow: const InfoWindow(
          //popup info
          title: 'Marker Title First ',
          snippet: 'My Custom Subtitle',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));

      markers.add(Marker(
        //add second marker
        markerId: MarkerId(showLocation.toString()),
        position: const LatLng(27.7099116, 85.3132343), //position of marker
        infoWindow: const InfoWindow(
          //popup info
          title: 'Marker Title Second ',
          snippet: 'My Custom Subtitle',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));

      markers.add(Marker(
        //add third marker
        markerId: MarkerId(showLocation.toString()),
        position: const LatLng(27.7137735, 85.315626), //position of marker
        infoWindow: const InfoWindow(
          //popup info
          title: 'Marker Title Third ',
          snippet: 'My Custom Subtitle',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));

      //add more markers here
    });

    return markers;
  }
}
