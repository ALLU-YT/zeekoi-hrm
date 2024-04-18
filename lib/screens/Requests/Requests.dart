import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:zeekoihrm/Api/LeaveTrakerapi/leaveReq.dart';
import 'package:zeekoihrm/Api/userapi.dart';
import 'package:zeekoihrm/provider/cameraaccess_provider.dart';
import 'package:zeekoihrm/screens/notificationScreen.dart';
import 'package:zeekoihrm/screens/profilepages/profilescreen.dart';
import 'package:zeekoihrm/screens/quickaction.dart/leavedetail.dart';

class Approvals extends StatefulWidget {
  const Approvals({Key? key}) : super(key: key);

  @override
  State<Approvals> createState() => _OrganizationState();
}

class _OrganizationState extends State<Approvals> {
  int selectedIndex = 0;
  late PageController _pageController;
  final Map<int, Widget> screens = {
    0: const Screen1(),
    1: const Screen2(),
    2: const Screen3(),
  };

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: selectedIndex);
    Provider.of<UserProfile>(context, listen: false).getProfile();
    Provider.of<LeaveReq>(context, listen: false).leaveReq();
  }

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
                            height: 45,
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
              'My Requests',
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
      body: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          Center(
            child: CupertinoSlidingSegmentedControl(
              thumbColor: const Color.fromARGB(158, 19, 3, 237),
              groupValue: selectedIndex,
              backgroundColor: const Color(0xFFF2F2F2),
              children: {
                0: buildSegment(
                    'Pending', 'assets/pending 1.png', selectedIndex == 0),
                1: buildSegment(
                    'Approved', 'assets/Layer 2 (1).png', selectedIndex == 1),
                2: buildSegment(
                    'Rejected', 'assets/73-Contract.png', selectedIndex == 2),
              },
              onValueChanged: (int? index) {
                if (index != null) {
                  setState(() {
                    selectedIndex = index;
                    _pageController.animateToPage(
                      selectedIndex,
                      duration: const Duration(milliseconds: 1),
                      curve: Curves.ease,
                    );
                  });
                }
              },
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (int index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              children: const [Screen1(), Screen2(), Screen3()],
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildSegment(String text, String imageString, bool isSelected) =>
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Image.asset(
            imageString,
            width: 24,
          ),
          const SizedBox(
            width: 2,
          ),
          Text(
            text,
            style: TextStyle(
              color: isSelected
                  ? Colors.white
                  : const Color.fromARGB(255, 2, 2, 2),
              fontSize: 12,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );

class Screen1 extends StatelessWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LeaveReq>(builder: (context, provider, _) {
      final leavetrackerlist = provider.leavetrackerlist;
      return ListView(
        children: [
          for (var leaveTrackerData in leavetrackerlist)
            Column(
              children: [
                if (leaveTrackerData.status == 'pending') // Check status here
                  Visibility(
                    visible: true, // Show if status is pending
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                child: LeavDetail(
                                  leaveTrackerData: leaveTrackerData,
                                ),
                                type: PageTransitionType.rightToLeft,
                                duration: const Duration(milliseconds: 300),
                                reverseDuration:
                                    const Duration(milliseconds: 300),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                            child: Row(
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * .1 -
                                          15,
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * .8 +
                                          24,
                                  height: 110,
                                  decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                          width: 1, color: Color(0xFFDB342A)),
                                      borderRadius:
                                          BorderRadius.circular(17.65),
                                    ),
                                    shadows: const [
                                      BoxShadow(
                                        color: Color(0x3F000000),
                                        blurRadius: 4,
                                        offset: Offset(0, 2),
                                        spreadRadius: 0,
                                      )
                                    ],
                                  ),
                                  child: Row(
                                    children: [
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(
                                              height: 25,
                                            ),
                                            Text(
                                              leaveTrackerData.leaveType,
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontFamily: 'Biryani',
                                                fontWeight: FontWeight.w600,
                                                height: 0.11,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              leaveTrackerData.startDate,
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontFamily: 'Biryani',
                                                fontWeight: FontWeight.w300,
                                                height: 0.13,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .2,
                                              height: 30,
                                              decoration: ShapeDecoration(
                                                color: const Color(0xFFFFEAE9),
                                                shape: RoundedRectangleBorder(
                                                  side: const BorderSide(
                                                      width: 1,
                                                      color: Color(0xFFD9302C)),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          11.02),
                                                ),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Center(
                                                  child: Text(
                                                    leaveTrackerData.status,
                                                    style: const TextStyle(
                                                      color: Color(0xFFD9302C),
                                                      fontSize: 11,
                                                      fontFamily: 'Biryani',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Column(
                                              children: [
                                                const SizedBox(
                                                  height: 40,
                                                ),
                                                Text(
                                                  leaveTrackerData
                                                      .dateDifference
                                                      .toString(),
                                                  style: const TextStyle(
                                                    color: Color(0xFFD9302C),
                                                    fontSize: 36.49,
                                                    fontFamily: 'Biryani',
                                                    fontWeight: FontWeight.w600,
                                                    height: 0.04,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 35,
                                                ),
                                                const Text(
                                                  'Day(s)',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14.59,
                                                    fontFamily: 'Biryani',
                                                    fontWeight: FontWeight.w300,
                                                    height: 0.11,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Image.asset(
                          'assets/Vector (9).png',
                          width: 15,
                        )
                      ],
                    ),
                  ),
              ],
            ),
        ],
      );
    });
  }
}

class Screen2 extends StatelessWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LeaveReq>(builder: (context, provider, _) {
      final leavetrackerlist = provider.leavetrackerlist;
      return ListView(
        children: [
          for (var leaveTrackerData in leavetrackerlist)
            Column(
              children: [
                if (leaveTrackerData.status == 'approved') // Check status here
                  Visibility(
                    visible: true, // Show if status is pending
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                child: LeavDetail(
                                  leaveTrackerData: leaveTrackerData,
                                ),
                                type: PageTransitionType.rightToLeft,
                                duration: const Duration(milliseconds: 300),
                                reverseDuration:
                                    const Duration(milliseconds: 300),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                            child: Row(
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * .1 -
                                          15,
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * .8 +
                                          24,
                                  height: 110,
                                  decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                          width: 1, color: Color(0xFFDB342A)),
                                      borderRadius:
                                          BorderRadius.circular(17.65),
                                    ),
                                    shadows: const [
                                      BoxShadow(
                                        color: Color(0x3F000000),
                                        blurRadius: 4,
                                        offset: Offset(0, 2),
                                        spreadRadius: 0,
                                      )
                                    ],
                                  ),
                                  child: Row(
                                    children: [
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(
                                              height: 25,
                                            ),
                                            Text(
                                              leaveTrackerData.leaveType,
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontFamily: 'Biryani',
                                                fontWeight: FontWeight.w600,
                                                height: 0.11,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              leaveTrackerData.startDate,
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontFamily: 'Biryani',
                                                fontWeight: FontWeight.w300,
                                                height: 0.13,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .2,
                                              height: 30,
                                              decoration: ShapeDecoration(
                                                color: const Color(0xFFFFEAE9),
                                                shape: RoundedRectangleBorder(
                                                  side: const BorderSide(
                                                      width: 1,
                                                      color: Color(0xFFD9302C)),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          11.02),
                                                ),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Center(
                                                  child: Text(
                                                    leaveTrackerData.status,
                                                    style: const TextStyle(
                                                      color: Color(0xFFD9302C),
                                                      fontSize: 11,
                                                      fontFamily: 'Biryani',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Column(
                                              children: [
                                                const SizedBox(
                                                  height: 40,
                                                ),
                                                Text(
                                                  leaveTrackerData
                                                      .dateDifference
                                                      .toString(),
                                                  style: const TextStyle(
                                                    color: Color(0xFFD9302C),
                                                    fontSize: 36.49,
                                                    fontFamily: 'Biryani',
                                                    fontWeight: FontWeight.w600,
                                                    height: 0.04,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 35,
                                                ),
                                                const Text(
                                                  'Day(s)',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14.59,
                                                    fontFamily: 'Biryani',
                                                    fontWeight: FontWeight.w300,
                                                    height: 0.11,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Image.asset(
                          'assets/Vector (9).png',
                          width: 15,
                        )
                      ],
                    ),
                  ),
              ],
            ),
        ],
      );
    });
  }
}

class Screen3 extends StatelessWidget {
  const Screen3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LeaveReq>(builder: (context, provider, _) {
      final leavetrackerlist = provider.leavetrackerlist;
      return ListView(
        children: [
          for (var leaveTrackerData in leavetrackerlist)
            Column(
              children: [
                if (leaveTrackerData.status == 'cancelled') // Check status here
                  Visibility(
                    visible: true, // Show if status is pending
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                child: LeavDetail(
                                  leaveTrackerData: leaveTrackerData,
                                ),
                                type: PageTransitionType.rightToLeft,
                                duration: const Duration(milliseconds: 300),
                                reverseDuration:
                                    const Duration(milliseconds: 300),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                            child: Row(
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * .1 -
                                          15,
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * .8 +
                                          24,
                                  height: 110,
                                  decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                          width: 1, color: Color(0xFFDB342A)),
                                      borderRadius:
                                          BorderRadius.circular(17.65),
                                    ),
                                    shadows: const [
                                      BoxShadow(
                                        color: Color(0x3F000000),
                                        blurRadius: 4,
                                        offset: Offset(0, 2),
                                        spreadRadius: 0,
                                      )
                                    ],
                                  ),
                                  child: Row(
                                    children: [
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(
                                              height: 25,
                                            ),
                                            Text(
                                              leaveTrackerData.leaveType,
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontFamily: 'Biryani',
                                                fontWeight: FontWeight.w600,
                                                height: 0.11,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              leaveTrackerData.startDate,
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontFamily: 'Biryani',
                                                fontWeight: FontWeight.w300,
                                                height: 0.13,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .2,
                                              height: 30,
                                              decoration: ShapeDecoration(
                                                color: const Color(0xFFFFEAE9),
                                                shape: RoundedRectangleBorder(
                                                  side: const BorderSide(
                                                      width: 1,
                                                      color: Color(0xFFD9302C)),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          11.02),
                                                ),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Center(
                                                  child: Text(
                                                    leaveTrackerData.status,
                                                    style: const TextStyle(
                                                      color: Color(0xFFD9302C),
                                                      fontSize: 11,
                                                      fontFamily: 'Biryani',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Column(
                                              children: [
                                                const SizedBox(
                                                  height: 40,
                                                ),
                                                Text(
                                                  leaveTrackerData
                                                      .dateDifference
                                                      .toString(),
                                                  style: const TextStyle(
                                                    color: Color(0xFFD9302C),
                                                    fontSize: 36.49,
                                                    fontFamily: 'Biryani',
                                                    fontWeight: FontWeight.w600,
                                                    height: 0.04,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 35,
                                                ),
                                                const Text(
                                                  'Day(s)',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14.59,
                                                    fontFamily: 'Biryani',
                                                    fontWeight: FontWeight.w300,
                                                    height: 0.11,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Image.asset(
                          'assets/Vector (9).png',
                          width: 15,
                        )
                      ],
                    ),
                  ),
              ],
            ),
        ],
      );
    });
  }
}
