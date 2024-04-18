import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zeekoihrm/Api/LeaveTrakerapi/l.dart';
// import 'package:zeekoihrm/Api/LeaveTrakerapi/LeaveSummert.dart';
import 'package:zeekoihrm/Api/LeaveTrakerapi/leaveTracerApiAll.dart';
import 'package:zeekoihrm/Api/getPayrollApiProvider.dart';

// import 'package:zeekoihrm/model/LeaveTraker/leaveTrackkerSummeryModel.dart';

class LeaveTrackerPicker extends StatefulWidget {
  const LeaveTrackerPicker({super.key});

  @override
  _MonthSelectorState createState() => _MonthSelectorState();
}

class _MonthSelectorState extends State<LeaveTrackerPicker> {
  // Initial month
  String currentMonth = 'Jan 2024 - Dec 2024';

  // Declare startDate and endDate variables
  String startDate = '2024-01-01';
  String endDate = '2024-12-31';

  @override
  void initState() {
    super.initState();
    Provider.of<LeaveTrackerApiAll>(context, listen: false)
        .getLeaveTrackerAll(startDate, endDate);
    Provider.of<Lapi>(context, listen: false)
        .getLeaveSummary(startDate, endDate);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .8 + 30,
      height: 46,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFF5727A3)),
          borderRadius: BorderRadius.circular(13),
        ),
      ),
      child: Row(
        children: [
          IconButton(
            icon: Image.asset(
              'assets/Vector (2).png',
              width: 13,
            ),
            onPressed: () async {
              Provider.of<GetPayRollApiProvider>(context, listen: false)
                  .fetchData();
              await Provider.of<LeaveTrackerApiAll>(context, listen: false)
                  .getLeaveTrackerAll(startDate, endDate);
              changeMonth(-1); // Decrement month
            },
          ),
          const Spacer(),
          Text(
            currentMonth,
            style: const TextStyle(
              color: Color(0xFF1B0044),
              fontSize: 15,
              fontFamily: 'Biryani',
              fontWeight: FontWeight.w700,
              height: 0.11,
            ),
          ),
          const Spacer(),
          IconButton(
            icon: Image.asset(
              'assets/Vector (1).png',
              width: 13,
            ),
            onPressed: () async {
              Provider.of<GetPayRollApiProvider>(context, listen: false)
                  .fetchData();
              await Provider.of<LeaveTrackerApiAll>(context, listen: false)
                  .getLeaveTrackerAll(startDate, endDate);
              changeMonth(1); // Increment month
            },
          ),
        ],
      ),
    );
  }

  // Method to update the displayed month
  void changeMonth(int monthChange) async {
    List<String> months = [
      'Jan 2023 - Dec 2023',
      'Jan 2024 - Dec 2024',
      'Jan 2022 - Dec 2022',
      'Jan 2021 - Dec 2021',
      'Jan 2020 - Dec 2020',
    ];

    int currentIndex = months.indexOf(currentMonth);
    int newIndex = (currentIndex + monthChange) % months.length;

    setState(() {
      currentMonth = months[newIndex];
    });

    int startYear = int.parse(currentMonth.split(' - ')[0].split(' ')[1]);
    int endYear = int.parse(currentMonth.split(' - ')[1].split(' ')[1]);

    startDate = '$startYear-01-01'; // Update startDate
    endDate = '$endYear-12-31'; // Update endDate

    final leaveTrackerApiA =
        Provider.of<LeaveTrackerApiAll>(context, listen: false);

    await leaveTrackerApiA.getLeaveTrackerAll(startDate, endDate);
  }
}


// Usage:
// LeaveTrackerPicker() // Include this widget in your app
