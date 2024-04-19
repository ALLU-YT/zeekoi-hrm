import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:zeekoihrm/Api/generalshiftApi.dart';
import 'package:zeekoihrm/screens/quickaction.dart/monthpickerAttendance.dart';
// import 'package:zeekoihrm/screens/quickaction.dart/payslip.dart';
import 'package:zeekoihrm/screens/services%20page/attendance/attendancedetails.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();

    // Format the date as a string
    String formattedDate = DateFormat('dd-MM-yyyy').format(today);
    String dayName = DateFormat('EEEE').format(today);
    return Consumer<CheckedIn>(
      builder: (context, value, child) {
        final timee = value.timeOnly;
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Attendance',
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
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Today is',
                      style: TextStyle(
                        color: Color(0xFF1B0044),
                        fontSize: 15,
                        fontFamily: 'Biryani',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Text(
                          dayName,
                          style: const TextStyle(
                            color: Color(0xFF1B0044),
                            fontSize: 29,
                            fontFamily: 'Biryani',
                            fontWeight: FontWeight.w700,
                            height: 0.05,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          formattedDate,
                          style: const TextStyle(
                            color: Color(0xFF1B0044),
                            fontSize: 15,
                            fontFamily: 'Biryani',
                            fontWeight: FontWeight.w400,
                            height: 0.11,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * .8 + 30,
                          height: 200,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  width: 1, color: Color(0xFFA228BC)),
                              borderRadius: BorderRadius.circular(17.65),
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width:
                                    MediaQuery.of(context).size.width * .4 + 25,
                                height: 200,
                                decoration: ShapeDecoration(
                                  gradient: const LinearGradient(
                                    begin: Alignment(0.97, -0.26),
                                    end: Alignment(-0.97, 0.26),
                                    colors: [
                                      Color(0xFF5E00FF),
                                      Color(0xFFE24D7B)
                                    ],
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(17.65),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        const SizedBox(
                                          width: 18,
                                        ),
                                        Container(
                                          width: 9,
                                          height: 40,
                                          decoration: ShapeDecoration(
                                            shape: RoundedRectangleBorder(
                                              side: const BorderSide(
                                                  width: 1,
                                                  color: Colors.white),
                                              borderRadius:
                                                  BorderRadius.circular(9),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 23,
                                        ),
                                        const Text(
                                          'Check In',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontFamily: 'Biryani',
                                            fontWeight: FontWeight.w700,
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 28,
                                    ),
                                    Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                            text: timee,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 35,
                                              fontFamily: 'Biryani',
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          const TextSpan(
                                            text: 'AM',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontFamily: 'Biryani',
                                              fontWeight: FontWeight.w700,
                                              height: 0.10,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      '26 April 2024',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontFamily: 'Biryani',
                                        fontWeight: FontWeight.w400,
                                        height: 0.11,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 7,
                              ),
                              Column(
                                children: [
                                  const SizedBox(
                                    height: 23,
                                  ),
                                  const Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: '07:30 ',
                                          style: TextStyle(
                                            color: Color(0xFFDB342A),
                                            fontSize: 35,
                                            fontFamily: 'Biryani',
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'PM',
                                          style: TextStyle(
                                            color: Color(0xFFDB342A),
                                            fontSize: 18,
                                            fontFamily: 'Biryani',
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Text(
                                    '26 April 2024',
                                    style: TextStyle(
                                      color: Color(0xFFE64237),
                                      fontSize: 17,
                                      fontFamily: 'Biryani',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 28,
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 25,
                                      ),
                                      const Text(
                                        'Check Out',
                                        style: TextStyle(
                                          color: Color(0xFFD9302C),
                                          fontSize: 14,
                                          fontFamily: 'Biryani',
                                          fontWeight: FontWeight.w400,
                                          height: 0.12,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 25,
                                      ),
                                      Container(
                                        width: 9,
                                        height: 40,
                                        decoration: ShapeDecoration(
                                          shape: RoundedRectangleBorder(
                                            side: const BorderSide(
                                                width: 1,
                                                color: Color(0xFFDB342A)),
                                            borderRadius:
                                                BorderRadius.circular(9),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    Row(
                      children: [
                        const DropdownButtonExamplee(),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .1 - 15,
                        ),
                        const MonthSelectorr()
                      ],
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    const AttendanceDetails()
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
