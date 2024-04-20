import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
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
          for (final userLeave in lapiProvider.userLeave)
            for (final entry in userLeave.userLeaves.entries)
              _SickLeaveContainerItem(
                id: entry.key, // Assuming entry.key holds the id value
                value: entry.value,
                approved: userLeave.leavesSummary[entry.key]?.approved,
              ),
        ],
      ),
    );
  }
}

class _SickLeaveContainerItem extends StatelessWidget {
  final String id;
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
    required this.id,
    required this.value,
    this.approved,
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
          const SizedBox(
            width: 10,
          ),
          CircularPercentIndicator(
            radius: 30.0,
            lineWidth: 5.0,
            percent: (approved != null)
                ? (approved! * 0.8 + 0.1)
                : 0.1, // Adjusting the range from 0.1 to 0.9
            // assuming approved is a double value between 0 and 1
            center: Text(
              "${approved != null ? approved.toString() : '0'}/$yearValue",
              style: const TextStyle(color: Colors.black),
            ),
            progressColor: Colors.green,
            backgroundColor: const Color(0xFFD5F6D4),
          ),
          const SizedBox(width: 20),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              leaveTypeMap[id] ?? '',
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
