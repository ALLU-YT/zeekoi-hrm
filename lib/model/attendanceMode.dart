class AttendanceData {
  final String date;
  final String clockInTime;
  final String clockInDelaySec;
  final String clockOutTime;
  final String clockOutEarlySec;
  final String shiftName;

  AttendanceData({
    required this.date,
    required this.clockInTime,
    required this.clockInDelaySec,
    required this.clockOutTime,
    required this.clockOutEarlySec,
    required this.shiftName,
  });

  factory AttendanceData.fromJson(Map<String, dynamic> json) {
    return AttendanceData(
      date: json['date'] ?? "",
      clockInTime: json['clock_in_time'] ?? "",
      clockInDelaySec: json['clock_in_delay_sec'] ?? "",
      clockOutTime: json['clock_out_time'] ?? "",
      clockOutEarlySec: json['clock_out_early_sec'] ?? "",
      shiftName: json['shift_name'] ?? "Null",
    );
  }
}

void main() {
  try {
    List<Map<String, dynamic>> jsonDataList = [
      {
        "date": "2024-03-27",
        "clock_in_time": "09:00:00",
        "clock_in_delay_sec": "0",
        "clock_out_time": "17:00:00",
        "clock_out_early_sec": "0",
        "shift_date": "2024-03-27"
      },
      // Add more data as needed
    ];

    List<AttendanceData> attendanceList =
        jsonDataList.map((json) => AttendanceData.fromJson(json)).toList();

    if (attendanceList.isNotEmpty) {
      for (var data in attendanceList) {
        print('Date: ${data.date}, Clock In Time: ${data.clockInTime}');
      }
    } else {
      print('No attendance data found.');
    }
  } catch (e, stackTrace) {
    print('Error: $e');
    print('StackTrace: $stackTrace');
  }
}
