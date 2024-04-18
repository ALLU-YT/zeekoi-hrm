// import 'package:flutter/material.dart';
// import 'package:location/location.dart';
// import 'package:flutter/services.dart';

// class LocationProvider extends ChangeNotifier {
//   Location location = Location();
//   bool? _serviceEnabled;
//   PermissionStatus? _permissionGranted;
//   LocationData? _locationData;

//   Future<void> initialize(BuildContext context) async {
//     _serviceEnabled = await location.serviceEnabled();
//     if (!_serviceEnabled!) {
//       _serviceEnabled = await location.requestService();
//       if (!_serviceEnabled!) {
//         return;
//       }
//     }

//     do {
//       _permissionGranted = await location.hasPermission();
//       if (_permissionGranted == PermissionStatus.denied) {
//         _permissionGranted = await location.requestPermission();
//         if (_permissionGranted == PermissionStatus.denied) {
//           showDialog(
//             context: context,
//             builder: (BuildContext context) {
//               return AlertDialog(
//                 title: Text("Location Permission Required"),
//                 content: Text("Please grant location permission to continue."),
//                 actions: <Widget>[
//                   TextButton(
//                     onPressed: () {
//                       SystemNavigator.pop(); // Close the app
//                     },
//                     child: Text("OK"),
//                   ),
//                 ],
//               );
//             },
//           );
//           return; // Return from the method after showing the dialog
//         }
//       }
//     } while (_permissionGranted != PermissionStatus.granted);

//     // Once permission is granted, get the location data
//     _locationData = await location.getLocation();
//     print('Latitude: ${_locationData!.latitude}');
//     print('Longitude: ${_locationData!.longitude}');
//     notifyListeners();
//   }

//   LocationData get locationData => _locationData!;
// }


// // class LocationPicker extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return ChangeNotifierProvider<LocationProvider>(
// //       create: (context) => LocationProvider(),
// //       child: Consumer<LocationProvider>(
// //         builder: (context, locationProvider, _) {
// //           return Scaffold(
// //             appBar: AppBar(
// //               title: Text('Location Picker'),
// //             ),
// //             body: Center(
// //               child: Column(
// //                 mainAxisAlignment: MainAxisAlignment.center,
// //                 children: <Widget>[
// //                   Text('Latitude: ${locationProvider.locationData?.latitude ?? 'Unknown'}'),
// //                   Text('Longitude: ${locationProvider.locationData?.longitude ?? 'Unknown'}'),
// //                 ],
// //               ),
// //             ),
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }

