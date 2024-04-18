import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:zeekoihrm/Api/userapi.dart';
import 'package:zeekoihrm/provider/cameraaccess_provider.dart';
import 'package:zeekoihrm/screens/notificationScreen.dart';
import 'package:zeekoihrm/screens/profilepages/profilescreen.dart';
import 'package:zeekoihrm/screens/quickaction.dart/leavetracker.dart';
import 'package:zeekoihrm/screens/quickaction.dart/payslip.dart';
import 'package:zeekoihrm/screens/services%20page/annoucements/announcement.dart';
import 'package:zeekoihrm/screens/services%20page/attendance/attendance.dart';
import 'package:zeekoihrm/screens/services%20page/organization/organization.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(PageTransition(
                  child: const ProfileScreen(),
                  type: PageTransitionType.fade,
                ));
              },
              child: context.watch<CameraAccessProvider>().selectedImage != null
                  ? CircleAvatar(
                      radius: 20,
                      backgroundImage: MemoryImage(
                        context.watch<CameraAccessProvider>().image!,
                      ),
                    )
                  : Consumer<UserProfile>(
                      builder: (context, userProfile, child) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(70.0),
                          child: Image.network(
                            userProfile.Profile ??
                                '', // Insert default URL here if Profile is null
                            width: 45, // Use 'Loading...' if Profile is null
                            fit: BoxFit.cover,
                            height: 45, // Use 'Loading...' if Profile is null
                            loadingBuilder: (context, child, progress) {
                              if (progress == null) {
                                return child;
                              } else {
                                return const CircularProgressIndicator();
                              }
                            },
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                width: 40,
                                height: 40,
                                decoration: const ShapeDecoration(
                                  color: Color(0xFFD9D9D9),
                                  shape: CircleBorder(),
                                ),
                                child: const Icon(Icons.person),
                              );
                            },
                          ),
                        );
                      },
                    ),
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              'Services',
              style: TextStyle(
                color: Color(0xFF1B0044),
                fontSize: 17,
                fontFamily: 'Biryani',
                fontWeight: FontWeight.w700,
              ),
            ),
            const Spacer(),
            IconButton(
              icon: Image.asset(
                'assets/Frame 1.png',
                width: 30,
              ), // Icon on the right
              onPressed: () {
                Navigator.of(context).push(PageTransition(
                    child: const NotificationScreen(),
                    type: PageTransitionType.fade));
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(PageTransition(
                        child: const LeaveTracker(),
                        type: PageTransitionType.fade));
                  },
                  child: Container(
                    width: 155.36,
                    height: 150.36,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFECE2FD),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17.65),
                      ),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        Image.asset(
                          'assets/calendar (1) 1.png',
                          width: 55,
                          height: 55,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          'Leave Tracker',
                          style: TextStyle(
                            color: Color(0xFF1B0044),
                            fontSize: 12.38,
                            fontFamily: 'Biryani',
                            fontWeight: FontWeight.w700,
                            height: 0.15,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .1 - 9,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(PageTransition(
                        child: const Organization(),
                        type: PageTransitionType.fade));
                  },
                  child: Container(
                    width: 155.36,
                    height: 150.36,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFECE2FD),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17.65),
                      ),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        Image.asset(
                          'assets/office 1 (1).png',
                          width: 55,
                          height: 55,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          'Organization',
                          style: TextStyle(
                            color: Color(0xFF1B0044),
                            fontSize: 12.38,
                            fontFamily: 'Biryani',
                            fontWeight: FontWeight.w700,
                            height: 0.15,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 22,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        child: const Announcements(),
                        type: PageTransitionType.fade));
              },
              child: Container(
                width: MediaQuery.of(context).size.width * .9,
                height: 69.18,
                decoration: ShapeDecoration(
                  color: const Color(0xFFECE2FD),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(11.42),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
                      child: Image.asset(
                        'assets/announcement 1 (3).png',
                        width: 35,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Text(
                      'Announcements',
                      style: TextStyle(
                        color: Color(0xFF1B0044),
                        fontSize: 15.38,
                        fontFamily: 'Biryani',
                        fontWeight: FontWeight.w700,
                        height: 0.15,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        child: const PaySlip(), type: PageTransitionType.fade));
              },
              child: Container(
                width: MediaQuery.of(context).size.width * .9,
                height: 69.18,
                decoration: ShapeDecoration(
                  color: const Color(0xFFECE2FD),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(11.42),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 0, 0, 10),
                      child: Image.asset(
                        'assets/salary 1.png',
                        width: 30,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Text(
                      'Payroll',
                      style: TextStyle(
                        color: Color(0xFF1B0044),
                        fontSize: 15.38,
                        fontFamily: 'Biryani',
                        fontWeight: FontWeight.w700,
                        height: 0.15,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 22,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(PageTransition(
                    child: const AttendanceScreen(),
                    type: PageTransitionType.fade));
              },
              child: Container(
                width: MediaQuery.of(context).size.width * .9,
                height: 69.18,
                decoration: ShapeDecoration(
                  color: const Color(0xFFECE2FD),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(11.42),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 10, 0, 10),
                      child: Image.asset(
                        'assets/attendance 1.png',
                        width: 30,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Text(
                      'Attendance',
                      style: TextStyle(
                        color: Color(0xFF1B0044),
                        fontSize: 15.38,
                        fontFamily: 'Biryani',
                        fontWeight: FontWeight.w700,
                        height: 0.15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 22,
            ),
          ],
        ),
      ),
    );
  }
}
