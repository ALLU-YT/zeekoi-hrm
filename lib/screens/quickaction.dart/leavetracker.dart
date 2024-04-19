import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:zeekoihrm/Api/LeaveTrakerapi/lUI.dart';
import 'package:zeekoihrm/Api/LeaveTrakerapi/leaveTracerApiAll.dart';
// import 'package:zeekoihrm/Api/LeaveTrakerapi/leaveTrackerPostMethod.dart';
// import 'package:zeekoihrm/model/LeaveTraker/leavetrakerallmodel.dart';
import 'package:zeekoihrm/screens/bottomnavbar.dart';
import 'package:zeekoihrm/screens/quickaction.dart/applyLeave.dart';
import 'package:zeekoihrm/screens/quickaction.dart/leavedetail.dart';
import 'package:zeekoihrm/screens/quickaction.dart/leavetrackerpicker.dart';

class LeaveTracker extends StatefulWidget {
  const LeaveTracker({super.key});

  @override
  State<LeaveTracker> createState() => _LeaveTrackerState();
}

class _LeaveTrackerState extends State<LeaveTracker> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Provider.of<LeaveTrackerApiAll>(context, listen: false)
        .getLeaveTrackerSummery();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LeaveTrackerApiAll>(builder: (context, provider, _) {
      final leavetrackerlist = provider.leavetrackerlist;
      final loading = provider.isLoading;

      return WillPopScope(
        onWillPop: () async {
          Navigator.of(context).push(PageTransition(
              child: const NavBar(), type: PageTransitionType.fade));
          return false;
        },
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            shape: const CircleBorder(),
            backgroundColor: Colors.transparent,
            onPressed: () {
              Navigator.push(
                context,
                PageTransition(
                  child: const ApplyLeave(),
                  type: PageTransitionType.leftToRight,
                  duration: const Duration(milliseconds: 300),
                  reverseDuration: const Duration(milliseconds: 300),
                ),
              );
            },
            child: Container(
              width: 50,
              height: 50,
              decoration: const ShapeDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0.00, -1.00),
                  end: Alignment(0, 1),
                  colors: [Color(0xFF6202FD), Color(0xFFDC4A82)],
                ),
                shape: CircleBorder(),
                shadows: [
                  BoxShadow(
                    color: Color(0x333B81AE),
                    blurRadius: 24,
                    offset: Offset(0, 14),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
          appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.only(
                  left: 14.0), // Adjust the left padding as needed
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          child: const NavBar(),
                          type: PageTransitionType.fade,
                          duration: const Duration(milliseconds: 300),
                          reverseDuration: const Duration(milliseconds: 300)));
                },
              ),
            ),
            title: const Text(
              'Leave tracker',
              style: TextStyle(
                color: Color(0xFF1B0044),
                fontSize: 17,
                fontFamily: 'Biryani',
                fontWeight: FontWeight.w700,
                height: 0.09,
              ),
            ),
          ),
          body: ListView(
            children: [
              const SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  const LeaveTrackerPicker(),
                  const SizedBox(
                    height: 30,
                  ),
                  loading
                      ? const Center(child: CircularProgressIndicator())
                      : Container(
                          child: Column(
                            children: [
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * .1 -
                                            17,
                                  ),

                                  //sickLeave.............................
                                  const SickLEaveContaiener(),
                                  const SizedBox(
                                    width: 25,
                                  ),
                                ]),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              Column(children: [
                                for (var leaveTrackerData in leavetrackerlist)
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          PageTransition(
                                              child: LeavDetail(
                                                  leaveTrackerData:
                                                      leaveTrackerData),
                                              type: PageTransitionType
                                                  .rightToLeft,
                                              duration: const Duration(
                                                  milliseconds: 300),
                                              reverseDuration: const Duration(
                                                  milliseconds: 300)));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 0, 0, 15),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .1 -
                                                15,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .8 +
                                                24,
                                            height: 110,
                                            decoration: ShapeDecoration(
                                              color: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                side: const BorderSide(
                                                    width: 1,
                                                    color: Color(0xFFDB342A)),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        17.65),
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
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const SizedBox(
                                                        height: 25,
                                                      ),
                                                      Text(
                                                        leaveTrackerData
                                                            .leaveType,
                                                        style: const TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 15,
                                                          fontFamily: 'Biryani',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          height: 0.11,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 15,
                                                      ),
                                                      Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            leaveTrackerData
                                                                .startDate,
                                                            style:
                                                                const TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  'Biryani',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                            ),
                                                          ),
                                                          const Icon(
                                                            Icons
                                                                .horizontal_rule,
                                                            size: 10,
                                                          ),
                                                          Text(
                                                            leaveTrackerData
                                                                .startDate,
                                                            style:
                                                                const TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  'Biryani',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            .2,
                                                        height: 30,
                                                        decoration:
                                                            ShapeDecoration(
                                                          color: const Color(
                                                              0xFFFFEAE9),
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            side: const BorderSide(
                                                                width: 1,
                                                                color: Color(
                                                                    0xFFD9302C)),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        11.02),
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Center(
                                                            child: Text(
                                                              leaveTrackerData
                                                                  .status,
                                                              style:
                                                                  const TextStyle(
                                                                color: Color(
                                                                    0xFFD9302C),
                                                                fontSize: 11,
                                                                fontFamily:
                                                                    'Biryani',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
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
                                                            style:
                                                                const TextStyle(
                                                              color: Color(
                                                                  0xFFD9302C),
                                                              fontSize: 36.49,
                                                              fontFamily:
                                                                  'Biryani',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              height: 0.04,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 35,
                                                          ),
                                                          const Text(
                                                            'Day(s)',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 14.59,
                                                              fontFamily:
                                                                  'Biryani',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                              height: 0.11,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                .1 -
                                                            35,
                                                      ),
                                                      Image.asset(
                                                        'assets/bxs_up-arrow.png',
                                                        width: 20,
                                                      )
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
                              ]),
                            ],
                          ),
                        ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
