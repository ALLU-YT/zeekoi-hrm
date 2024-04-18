import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zeekoihrm/Api/LeaveTrakerapi/l.dart';

class SickLEaveContaiener extends StatelessWidget {
  const SickLEaveContaiener({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final lapiProvider = Provider.of<Lapi>(context);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (final leaveSummary in lapiProvider.leaveSummary)
            for (final userLeave in lapiProvider.userLeave)
              for (final entry in leaveSummary.leavesSummary.entries)
                for (final yearData in userLeave.userLeaves.entries)
                  _SickLeaveContainerItem(
                    leaveType: entry.key,
                    approved: entry.value.approved,
                    value: yearData.value,
                    year: '',
                  ),
        ],
      ),
    );
  }
}

class _SickLeaveContainerItem extends StatelessWidget {
  final String leaveType;
  final String year;
  final Map<String, dynamic> value;
  final double? approved;
  final Map<String, String> leaveTypeMap = {
    "1": "Saturday Off",
    "2": "SICK LEAVE",
    "3": "Compensatory Off",
    "4": "Off",
    "7": "Annual Leave",
    "8": "Emergency",
    "9": "Earned"
  };

  _SickLeaveContainerItem({
    required this.leaveType,
    required this.approved,
    required this.value,
    required this.year,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final yearValue = value['year']; // Extract the year value
    return Container(
      margin: const EdgeInsets.only(right: 10),
      width: 247,
      height: 80,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFF6504F9)),
          borderRadius: BorderRadius.circular(17.65),
        ),
      ),
      child: Row(
        children: [
          const SizedBox(width: 15),
          Container(
            width: 48,
            height: 48,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                    width: 5, color: Color.fromARGB(255, 53, 249, 4)),
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            child: Container(
              width: 58,
              height: 58,
              decoration: const ShapeDecoration(
                color: Color(0xFFD5F6D4),
                shape: OvalBorder(),
              ),
              child: Center(
                child: Text(
                  "${approved != null ? approved.toString() : '0'}/$yearValue",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 11,
                    fontFamily: 'Biryani',
                    fontWeight: FontWeight.w700,
                    height: 1,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              leaveTypeMap[leaveType] ?? '',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Biryani',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
