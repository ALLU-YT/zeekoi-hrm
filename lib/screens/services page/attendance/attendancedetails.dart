import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zeekoihrm/Api/attendancelistApiProvider.dart';
import 'package:zeekoihrm/re-use-code.dart/formatedate.dart';

class AttendanceDetails extends StatefulWidget {
  const AttendanceDetails({Key? key}) : super(key: key);

  @override
  State<AttendanceDetails> createState() => _AttendanceDetailsState();
}

class _AttendanceDetailsState extends State<AttendanceDetails> {
  @override
  void initState() {
    super.initState();
    // Get the current year and month
    DateTime now = DateTime.now();
    String currentYear = now.year.toString();
    String currentMonth = now.month.toString().padLeft(2, '0');

    // Call the method with the current year and month
    Provider.of<AttendanceListApiProvider>(context, listen: false)
        .getAttendanceList(currentYear, currentMonth);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AttendanceListApiProvider>(builder: (context, provider, _) {
      final attendanceList = provider.attendanceList;
      final loading = provider.isLoading;
      return loading
          ? const Center(child: CircularProgressIndicator())
          : Scrollbar(
              thumbVisibility: true,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        _buildDateContainer('Date'),
                        _buildDateContainer('Clock in'),
                        _buildDateContainer('Delayed time'),
                        _buildDateContainer('Clock out'),
                        _buildDateContainer('Early time'),
                        _buildDateContainer('Shift'),
                      ],
                    ),
                    for (var attendanceData in attendanceList)
                      Row(
                        children: [
                          _buildContainer1(attendanceData.date, isDate: true),
                          _buildContainer2(attendanceData.clockInTime),
                          _buildContainer4(attendanceData.clockInDelaySec,
                              isDuration: true),
                          _buildContainer2(attendanceData.clockOutTime),
                          _buildContainer4(attendanceData.clockOutEarlySec,
                              isDuration: true),
                          _buildContainer(attendanceData.shiftDate),
                        ],
                      ),
                  ],
                ),
              ),
            );
    });
  }

  String formatDuration(String secondsString) {
    int seconds = int.tryParse(secondsString) ?? 0;

    // Convert seconds to Duration
    Duration duration = Duration(seconds: seconds);

    // Extract hours, minutes, and seconds
    int hours = duration.inHours;
    int minutes = duration.inMinutes.remainder(60);
    int remainingSeconds = duration.inSeconds.remainder(60);

    // Construct formatted string
    String formattedDuration = '$hours hr-$minutes m-$remainingSeconds s';

    return formattedDuration;
  }

  Widget _buildContainer4(String data,
      {bool isDate = false, bool isDuration = false}) {
    String formattedData = data;
    if (isDuration) {
      try {
        formattedData = formatDuration(data);
      } catch (e) {
        print('Error formatting duration: $e');
      }
    }

    return Container(
      width: 118,
      height: 50,
      margin: const EdgeInsets.only(right: 0),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: const Color(0xFFD9D9D9)),
      ),
      child: Center(
        child: Text(
          formattedData,
          style: const TextStyle(
            color: Color(0xFF1B0044),
            fontSize: 14.38,
            fontFamily: 'Biryani',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildContainer1(String data, {bool isDate = false}) {
    String formattedData = data;
    try {
      if (isDate) {
        formattedData = formatStringDateToDDMMM(data);
      }
    } catch (e) {
      print('Error formatting date: $e');
    }

    return Container(
      width: 118,
      height: 50,
      margin: const EdgeInsets.only(right: 0),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: const Color(0xFFD9D9D9)),
      ),
      child: Center(
        child: Text(
          formattedData,
          style: const TextStyle(
            color: Color(0xFF1B0044),
            fontSize: 14.38,
            fontFamily: 'Biryani',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildContainer2(String data, {bool isDate = false}) {
    String formattedData = data;
    if (isDate) {
      try {
        formattedData = formatStringDateToDDMMM(data);
      } catch (e) {
        print('Error formatting date: $e');
      }
    } else {
      // Extract only time part if it's not a date
      List<String> parts = data.split(' ');
      if (parts.length == 2) {
        String timePart = parts[1]; // Extracting time part
        List<String> timeParts = timePart.split(':');
        if (timeParts.length == 3) {
          int hour = int.parse(timeParts[0]);
          int minute = int.parse(timeParts[1]);
          print(minute);
          String period = hour < 12 ? 'AM' : 'PM';
          hour = hour % 12;
          if (hour == 0) {
            hour = 12; // 12-hour format adjustment
          }
          formattedData =
              '$hour:${timeParts[1]} $period'; // Constructing new time string
        }
      }
    }
    return Container(
      width: 118,
      height: 50,
      margin: const EdgeInsets.only(right: 0),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: const Color(0xFFD9D9D9)),
      ),
      child: Center(
        child: Text(
          formattedData,
          style: const TextStyle(
            color: Color(0xFF1B0044),
            fontSize: 14.38,
            fontFamily: 'Biryani',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildDateContainer(String date) {
    return Container(
      width: 118,
      height: 50,
      margin: const EdgeInsets.only(right: 0),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: const Color(0xFFD9D9D9)),
      ),
      child: Center(
        child: Text(
          date,
          style: const TextStyle(
            color: Color(0xFF1B0044),
            fontSize: 14.38,
            fontFamily: 'Biryani',
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

// .
// .
// .
// .
// .
  Widget _buildContainer(String data) {
    return Container(
      width: 118,
      height: 50,
      margin: const EdgeInsets.only(right: 0),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: const Color(0xFFD9D9D9)),
      ),
      child: Center(
        child: Text(
          data,
          style: const TextStyle(
            color: Color(0xFF1B0044),
            fontSize: 14.38,
            fontFamily: 'Biryani',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
