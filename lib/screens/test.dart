// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class SliverDoctorDetail extends StatefulWidget {
//   const SliverDoctorDetail({Key? key}) : super(key: key);

//   @override
//   State<SliverDoctorDetail> createState() => _SliverDoctorDetailState();
// }

// class _SliverDoctorDetailState extends State<SliverDoctorDetail> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomScrollView(
//         slivers: [
//           SliverAppBar(
//             pinned: true,
//             title: const Text('Detail Doctor'),
//             backgroundColor: Color( 0xff575de3),
//             expandedHeight: 200,
//             flexibleSpace: const FlexibleSpaceBar(
//               background: Image(
//                 image: AssetImage('images/hospital.jpeg'),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           const SliverToBoxAdapter(
//             child: DetailBody(),
//           )
//         ],
//       ),
//     );
//   }
// }

// class DetailBody extends StatefulWidget {
//   const DetailBody({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<DetailBody> createState() => _DetailBodyState();
// }

// class _DetailBodyState extends State<DetailBody> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(20),
//       margin: const EdgeInsets.only(bottom: 30),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           const DetailDoctorCard(),
//           const SizedBox(
//             height: 15,
//           ),
//           const DoctorInfo(),
//           const SizedBox(
//             height: 30,
//           ),
//           Text(
//             'About Doctor',
//             style: TextStyle(
//   color: Color(0xff151a56),
//   fontWeight: FontWeight.bold,
// ),
//           ),
//           const SizedBox(
//             height: 15,
//           ),
//           Text(
//             'Dr. Joshua Simorangkir is a specialist in internal medicine who specialzed blah blah.',
//             style: TextStyle(
//               color: Color(0xff151a56),
//               fontWeight: FontWeight.w500,
//               height: 1.5,
//             ),
//           ),
//           const SizedBox(
//             height: 25,
//           ),
//           Text(
//             'Location',
//             style: TextStyle(
//   color: Color(0xff151a56),
//   fontWeight: FontWeight.bold,
// ),
//           ),
//           const SizedBox(
//             height: 25,
//           ),
//           const DoctorLocation(),
//           const SizedBox(
//             height: 25,
//           ),
//           ElevatedButton(
//             style: ButtonStyle(
//               backgroundColor: MaterialStateProperty.all<Color>(
//                 Color(0xff575de3),
//               ),
//             ),
//             child: const Text('Book Appointment'),
//             onPressed: () => {},
//           )
//         ],
//       ),
//     );
//   }
// }

// class DoctorLocation extends StatefulWidget {
//   const DoctorLocation({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<DoctorLocation> createState() => _DoctorLocationState();
// }

// class _DoctorLocationState extends State<DoctorLocation> {
//             // center: latLng.LatLng(11.0168445, 76.9558321),

//               late GoogleMapController mapController; //contrller for Google map
//   final Set<Marker> markers = {}; //markers for google map
//   static const LatLng showLocation =
//       LatLng(11.0168445, 76.9558321); 
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: double.infinity,
//       height: 200,
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(20),
//         child: GoogleMap(
//         //Map widget from google_maps_flutter package
//         zoomGesturesEnabled: true, //enable Zoom in, out on map
//         initialCameraPosition: const CameraPosition(
//           //innital position in map
//           target: showLocation, //initial position
//           zoom: 15.0, //initial zoom level
//         ),
//         markers: getmarkers(), //markers to show on map
//         mapType: MapType.normal, //map type
//         onMapCreated: (controller) {
//           //method called when map is created
//           setState(() {
//             mapController = controller;
//           });
//         },
//       ),
//       ),
//     );
//   }
//     Set<Marker> getmarkers() {
//     //markers to place on map
//     setState(() {
//       markers.add(Marker(
//         //add first marker
//         markerId: MarkerId(showLocation.toString()),
//         position: showLocation, //position of marker
//         infoWindow: const InfoWindow(
//           //popup info
//           title: 'Marker Title First ',
//           snippet: 'My Custom Subtitle',
//         ),
//         icon: BitmapDescriptor.defaultMarker, //Icon for Marker
//       ));

//       markers.add(Marker(
//         //add second marker
//         markerId: MarkerId(showLocation.toString()),
//         position: const LatLng(27.7099116, 85.3132343), //position of marker
//         infoWindow: const InfoWindow(
//           //popup info
//           title: 'Marker Title Second ',
//           snippet: 'My Custom Subtitle',
//         ),
//         icon: BitmapDescriptor.defaultMarker, //Icon for Marker
//       ));

//       markers.add(Marker(
//         //add third marker
//         markerId: MarkerId(showLocation.toString()),
//         position: const LatLng(27.7137735, 85.315626), //position of marker
//         infoWindow: const InfoWindow(
//           //popup info
//           title: 'Marker Title Third ',
//           snippet: 'My Custom Subtitle',
//         ),
//         icon: BitmapDescriptor.defaultMarker, //Icon for Marker
//       ));

//       //add more markers here
//     });

//     return markers;
//   }
// }

// class DoctorInfo extends StatefulWidget {
//   const DoctorInfo({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<DoctorInfo> createState() => _DoctorInfoState();
// }

// class _DoctorInfoState extends State<DoctorInfo> {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: const [
//         NumberCard(
//           label: 'Patients',
//           value: '100+',
//         ),
//         SizedBox(width: 15),
//         NumberCard(
//           label: 'Experiences',
//           value: '10 years',
//         ),
//         SizedBox(width: 15),
//         NumberCard(
//           label: 'Rating',
//           value: '4.0',
//         ),
//       ],
//     );
//   }
// }

// class AboutDoctor extends StatefulWidget {
//   final String title;
//   final String desc;
//   const AboutDoctor({
//     Key? key,
//     required this.title,
//     required this.desc,
//   }) : super(key: key);

//   @override
//   State<AboutDoctor> createState() => _AboutDoctorState();
// }

// class _AboutDoctorState extends State<AboutDoctor> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

// class NumberCard extends StatefulWidget {
//   final String label;
//   final String value;

//   const NumberCard({
//     Key? key,
//     required this.label,
//     required this.value,
//   }) : super(key: key);

//   @override
//   State<NumberCard> createState() => _NumberCardState();
// }

// class _NumberCardState extends State<NumberCard> {
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(15),
//           color: Color(0xffe8eafe),
//         ),
//         padding: const EdgeInsets.symmetric(
//           vertical: 30,
//           horizontal: 15,
//         ),
//         child: Column(
//           children: [
//             Text(
//               widget.label,
//               style: TextStyle(
//                 color: Color(0xff9796af),
//                 fontSize: 12,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             Text(
//               widget.value,
//               style: TextStyle(
//                 color: Color(0xff151a56),
//                 fontSize: 15,
//                 fontWeight: FontWeight.w800,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class DetailDoctorCard extends StatefulWidget {
//   const DetailDoctorCard({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<DetailDoctorCard> createState() => _DetailDoctorCardState();
// }

// class _DetailDoctorCardState extends State<DetailDoctorCard> {
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//       child: Container(
//         padding: const EdgeInsets.all(15),
//         width: double.infinity,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Dr. Josua Simorangkir',
//                     style: TextStyle(
//                         color: Color(0xff151a56),
//                         fontWeight: FontWeight.w700),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Text(
//                     'Heart Specialist',
//                     style: TextStyle(
//                       color: Color(0xff9796af),
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const Image(
//               image: AssetImage('images/doctor01.jpeg'),
//               width: 100,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
