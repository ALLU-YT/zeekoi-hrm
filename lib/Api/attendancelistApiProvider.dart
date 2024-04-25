import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zeekoihrm/model/attendanceMode.dart';

class AttendanceListApiProvider extends ChangeNotifier {
  List<AttendanceData> attendanceList = [];
  String? checkouttime;
  String? chcekoutDate;
  String? clockinTimer;
  String? clockinDate;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  Future<void> getAttendanceList(String year, String month) async {
    _isLoading = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('access_token') ?? "";
    String domain = prefs.getString("domain") ?? "";

    try {
      final headers = {
        'Authorization': "Bearer $accessToken",
      };
      Uri url = Uri.parse(
          '$domain/api/hrm/attendance?start_date=$year-$month-01&end_date=$year-$month-31');

      var response = await http.get(url, headers: headers);
      // print('API Response: ${response.body}');
      if (response.statusCode == 200) {
        dynamic jsonData = jsonDecode(response.body);

        if (jsonData['success'] == true && jsonData.containsKey('data')) {
          List<dynamic> dataList = jsonData['data'];
          attendanceList = dataList
              .map((json) =>
                  AttendanceData.fromJson(json as Map<String, dynamic>))
              .toList();

          // Assuming attendanceList.first.clockOutTime and attendanceList.first.clockInTime are strings in "yyyy-MM-dd HH:mm:ss" format
          String clockOutTimeString = attendanceList.first.clockOutTime;

// Parse the string into a DateTime object
          DateTime clockOutDateTime = DateTime.parse(clockOutTimeString);

// Extract time and date components
          checkouttime =
              '${clockOutDateTime.hour.toString().padLeft(2, '0')}:${clockOutDateTime.minute.toString().padLeft(2, '0')}';
          chcekoutDate =
              '${clockOutDateTime.year}-${clockOutDateTime.month.toString().padLeft(2, '0')}-${clockOutDateTime.day.toString().padLeft(2, '0')}';

          // Assuming attendanceList.first.clockOutTime and attendanceList.first.clockInTime are strings in "yyyy-MM-dd HH:mm:ss" format
          String clockOutTimeStringg = attendanceList.first.clockInTime;

// Parse the string into a DateTime object
          DateTime clockInTimee = DateTime.parse(clockOutTimeStringg);

// Extract time and date components
          clockinTimer =
              '${clockInTimee.hour.toString().padLeft(2, '0')}:${clockInTimee.minute.toString().padLeft(2, '0')}';
          clockinDate =
              '${clockInTimee.year}-${clockInTimee.month.toString().padLeft(2, '0')}-${clockInTimee.day.toString().padLeft(2, '0')}';

          // for (var data in attendanceList) {
          //   print('Date: ${data.date}');
          //   print('Clock In Time: ${data.clockInTime}');
          //   print('Clock In Delay: ${data.clockInDelaySec}');
          //   print('Clock Out Time: ${data.clockOutTime}');
          //   print('Clock Out Early: ${data.clockOutEarlySec}');
          //   print('Shift Date: ${data.shiftDate}');
          //   print('-----------------------------');
          // }
          _isLoading = false;
          notifyListeners(); // Notify listeners that data has been updated
        } else {
          print('API Response does not contain expected data.');
        }
      } else {
        print('HTTP Request Failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> fetchData() async {
    try {
      _isLoading = true;
      notifyListeners();
      print("isLoading");

      // Fetch data here

      // Simulating a delay of 2 seconds
      await Future.delayed(const Duration(seconds: 3));

      // After fetching data, hide loading indicator
      _isLoading = false;
      notifyListeners();
    } catch (error) {
      // Handle error if any
      print("Error fetching data: $error");
      _isLoading = false;
      notifyListeners();
    }
  }
}
