import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:zeekoihrm/model/LeaveTraker/leavetrakerallmodel.dart';
import 'package:zeekoihrm/screens/quickaction.dart/leavetracker.dart';

class LeavDetail extends StatefulWidget {
  final LeaveTrackerAllModel?
      leaveTrackerData; // Define variable to receive data

  const LeavDetail({this.leaveTrackerData, super.key});

  @override
  State<LeavDetail> createState() => _LeavDetailState();
}

class _LeavDetailState extends State<LeavDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 14.0),
          child: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                PageTransition(
                  child: const LeaveTracker(),
                  type: PageTransitionType.leftToRight,
                  duration: const Duration(milliseconds: 300),
                  reverseDuration: const Duration(milliseconds: 300),
                ),
              );
            },
          ),
        ),
        title: const Text(
          'Leave detail',
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
        children: <Widget>[
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Leave type',
                    style: TextStyle(
                      color: Color(0xFF909090),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.leaveTrackerData!.leaveType,
                    style: const TextStyle(
                      color: Color(0xFF1D2730),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Divider(
                      height: 0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Text(
                        'Leave type',
                        style: TextStyle(
                          color: Color(0xFF909090),
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                      Spacer(),
                      Text(
                        'Day(s)',
                        style: TextStyle(
                          color: Color(0xFF909090),
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                      Spacer(),
                      Text(
                        'End Date',
                        style: TextStyle(
                          color: Color(0xFF909090),
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        widget.leaveTrackerData!.startDate,
                        style: const TextStyle(
                          color: Color(0xFF1D2730),
                          fontSize: 13,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        widget.leaveTrackerData!.dateDifference.toString(),
                        style: const TextStyle(
                          color: Color(0xFF1D2730),
                          fontSize: 23,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        widget.leaveTrackerData!.endDate,
                        style: const TextStyle(
                          color: Color(0xFF1D2730),
                          fontSize: 13,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 350,
                    height: 4,
                    decoration: ShapeDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment(1.00, 0.00),
                        end: Alignment(-1, 0),
                        colors: [Color(0xFF2F9623), Color(0xFFDB342A)],
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(65),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Divider(
                      height: 0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Session',
                    style: TextStyle(
                      color: Color(0xFF909090),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.leaveTrackerData!.leaveSession,
                    style: const TextStyle(
                      color: Color(0xFF1D2730),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Divider(
                      height: 0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Paid/Unpaid',
                    style: TextStyle(
                      color: Color(0xFF909090),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * .2,
                        decoration: ShapeDecoration(
                          color: const Color(0xFFFFEAE9),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              width: 1,
                              color: Color(0xFF2F9623),
                            ),
                            borderRadius: BorderRadius.circular(11.02),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Center(
                              child: Text(
                            'UnPaid',
                            style: TextStyle(
                              color: Color(0xFF2F9623),
                              fontSize: 11.01,
                              fontFamily: 'Biryani',
                              fontWeight: FontWeight.w600,
                            ),
                          )),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * .2,
                        decoration: ShapeDecoration(
                          color: const Color(0xFFFFEAE9),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              width: 1,
                              color: Color(0xFF2F9623),
                            ),
                            borderRadius: BorderRadius.circular(11.02),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Center(
                              child: Text(
                            'Paid',
                            style: TextStyle(
                              color: Color(0xFF2F9623),
                              fontSize: 11.01,
                              fontFamily: 'Biryani',
                              fontWeight: FontWeight.w600,
                            ),
                          )),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Divider(
                      height: 0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Status',
                    style: TextStyle(
                      color: Color(0xFF909090),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * .2,
                        height: 30,
                        decoration: ShapeDecoration(
                          color: const Color(0xFFFFEAE9),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              width: 1,
                              color: Color(0xFFD9302C),
                            ),
                            borderRadius: BorderRadius.circular(11.02),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                              child: Text(
                            widget.leaveTrackerData!.status,
                            style: const TextStyle(
                                color: Color(0xFFD9302C),
                                fontSize: 11.01,
                                fontFamily: 'Biryani',
                                fontWeight: FontWeight.w600,
                                height: 1),
                          )),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Divider(
                      height: 0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Reason',
                    style: TextStyle(
                      color: Color(0xFF909090),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.leaveTrackerData!.reason,
                    style: const TextStyle(
                      color: Color(0xFF1D2730),
                      fontSize: 13,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Divider(
                      height: 0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
