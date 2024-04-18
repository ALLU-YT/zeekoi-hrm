// import 'dart:io';

// import 'package:flutter/material.dart';

// import 'package:url_launcher/url_launcher.dart';

// class Screen1 extends StatefulWidget {
//   @override
//   State<Screen1> createState() => _Screen1State();
// }

// class _Screen1State extends State<Screen1> {
//   File? selectedImage;
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       children: [
//         Column(
//           children: [
//             const SizedBox(
//               height: 25,
//             ),
//             Padding(
//               padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
//               child: Container(
//                 width: 345,
//                 height: 340,
//                 decoration: ShapeDecoration(
//                   shape: RoundedRectangleBorder(
//                     side: BorderSide(width: 1, color: Color(0xFF6504F9)),
//                     borderRadius: BorderRadius.circular(17.65),
//                   ),
//                 ),
//                 child: Column(
//                   children: [
//                     const SizedBox(
//                       height: 25,
//                     ),
//                     const CircleAvatar(
//                       radius: 40,
//                     ),
//                     const SizedBox(
//                       height: 25,
//                     ),
//                     const Text(
//                       'Abad Sait',
//                       style: TextStyle(
//                         color: Color(0xFF1B0044),
//                         fontSize: 24,
//                         fontFamily: 'Biryani',
//                         fontWeight: FontWeight.w700,
//                         height: 0.07,
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 25,
//                     ),
//                     const Text(
//                       'Project Manager',
//                       style: TextStyle(
//                         color: Color(0xFF5727A3),
//                         fontSize: 11,
//                         fontFamily: 'Biryani',
//                         fontWeight: FontWeight.w300,
//                         height: 0.14,
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 25,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         GestureDetector(
//                           onTap: () async {
//                             encodeQueryParameters(Map<String, String> params) {
//                               return params.entries
//                                   .map((MapEntry<String, String> e) =>
//                                       '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
//                                   .join('&');
//                             }

//                             final Uri emailUri = Uri(
//                               scheme: 'mailto',
//                               path: 'ameen.33.ns@gmail.com',
//                               query: encodeQueryParameters(<String, String>{
//                                 'subject': 'Give Some',
//                                 'body': 'SomeThing...'
//                               }),
//                             );
//                             if (await canLaunchUrl(emailUri)) {
//                               launchUrl(emailUri);
//                             } else {
//                               throw Exception('Could not launch $emailUri');
//                             }
//                           },
//                           child: Container(
//                             width: 39,
//                             height: 39,
//                             decoration: ShapeDecoration(
//                               color: Color(0xFFFFC107),
//                               shape: OvalBorder(),
//                             ),
//                             child: Center(
//                                 child: Image.asset(
//                               'assets/Group.png',
//                               width: 20,
//                             )),
//                           ),
//                         ),
//                         const SizedBox(
//                           width: 20,
//                         ),
//                         GestureDetector(
//                           onTap: () async {
//                             String phoneNumber =
//                                 '9995598212'; // Replace with the desired telephone number

//                             final Uri telUri = Uri(
//                               scheme: 'tel',
//                               path: phoneNumber,
//                             );

//                             if (await canLaunchUrl(telUri)) {
//                               launchUrl(telUri);
//                             } else {
//                               throw Exception('Could not launch $telUri');
//                             }
//                           },
//                           child: Container(
//                             width: 39,
//                             height: 39,
//                             decoration: const ShapeDecoration(
//                               color: Color(0xFF2F9623),
//                               shape: OvalBorder(),
//                             ),
//                             child: Center(
//                               child: Image.asset(
//                                 'assets/telephone 2.png',
//                                 width: 20,
//                               ),
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 25,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Image.asset(
//                           'assets/telephone 1.png',
//                           width: 20,
//                         ),
//                         const SizedBox(
//                           width: 10,
//                         ),
//                         Text(
//                           '+91 8113892003',
//                           style: TextStyle(
//                             color: Color(0xFF1B0044),
//                             fontSize: 12,
//                             fontFamily: 'Biryani',
//                             fontWeight: FontWeight.w400,
//                             height: 0.14,
//                           ),
//                         )
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 25,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Image.asset(
//                           'assets/mail 1.png',
//                           width: 20,
//                         ),
//                         const SizedBox(
//                           width: 10,
//                         ),
//                         Text(
//                           'abad@zeekoi.info',
//                           style: TextStyle(
//                             color: Color(0xFF1B0044),
//                             fontSize: 12,
//                             fontFamily: 'Biryani',
//                             fontWeight: FontWeight.w400,
//                             height: 0.14,
//                           ),
//                         )
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             )
//           ],
//         )
//       ],
//     );
//   }
// }
