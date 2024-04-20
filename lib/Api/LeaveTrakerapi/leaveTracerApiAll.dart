import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:zeekoihrm/model/LeaveTraker/leaveSummery.dart';
import 'package:zeekoihrm/model/LeaveTraker/leaveTrackkerSummeryModel.dart';
import 'package:zeekoihrm/model/LeaveTraker/leavetrakerallmodel.dart';

class LeaveTrackerApiAll extends ChangeNotifier {
  List<LeaveTrackerAllModel> leavetrackerlist = [];

  bool _isLoading = false;
  String? id1;
  String? id2;
  String? id3;
  String? id4;
  String? id7;
  String? id8;
  String? id9;
  String? fullday;
  String? firsthalf;
  String? secondhalf;

  bool get isLoading => _isLoading;
  String? DateDifferent;
  Future<void> getLeaveTrackerAll(String startDate, String endDate) async {
    _isLoading = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('access_token') ?? "";
    String domain = prefs.getString("domain") ?? "";

    try {
      final headers = {
        'Authorization': "Bearer $accessToken",
      };
      Uri url = Uri.parse(
          '$domain/api/hrm/leave?start_date=$startDate-01&end_date=$endDate&order=desc');

      var response = await http.get(url, headers: headers);
      // print('API Response: ${response.body}');
      if (response.statusCode == 200) {
        dynamic jsonData = jsonDecode(response.body);

        if (jsonData['success'] == true && jsonData.containsKey('data')) {
          List<dynamic> dataList = jsonData['data'];
          leavetrackerlist = dataList
              .map((json) =>
                  LeaveTrackerAllModel.fromJson(json as Map<String, dynamic>))
              .toList();

          // Print the fetched attendance data
          for (var data in leavetrackerlist) {
            // Parse dates
            DateTime startDate = DateTime.parse(data.startDate);
            DateTime endDate = DateTime.parse(data.endDate);

            // Calculate difference
            Duration difference = endDate.difference(startDate);

            // Print the difference
            // print(
            //     'ID: ${data.id}, User: ${data.user}, Leave Type: ${data.leaveType}, Date Difference: ${difference.inDays} days');
            data.dateDifference =
                difference.inDays + 1; // Adding 1 to the date difference

            // print('-----------------------------');
          }

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

//get Summery

  void getLeaveTrackerSummery() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('access_token') ?? "";
    String domain = prefs.getString("domain") ?? "";

    try {
      final headers = {
        'Authorization': "Bearer $accessToken",
      };
      Uri url = Uri.parse('$domain/api/hrm/leave/dropdown');

      var response = await http.get(url, headers: headers);
      // print(response.body);
      // print(response.body);
      if (response.statusCode == 200) {
        LeaveTrackerSummery leavetrackersummery =
            LeaveTrackerSummery.fromJson(jsonDecode(response.body));
        id1 = leavetrackersummery.s1;
        id2 = leavetrackersummery.s2;
        id3 = leavetrackersummery.s3;
        id4 = leavetrackersummery.s4;
        id7 = leavetrackersummery.s7;
        id8 = leavetrackersummery.s8;

        id9 = leavetrackersummery.s9;
        fullday = leavetrackersummery.fullDay;
        firsthalf = leavetrackersummery.forenoonHalfday;
        secondhalf = leavetrackersummery.afternoonHalfday;

        notifyListeners();
      }
    } catch (e) {}
  }

  void dataConvertbacktoId(String leaveType, String resultsessiondata,
      String date, String endDate, String reason) {
    // Define a map that maps leave type to its corresponding ID
    Map<String, String?> leaveTypeToId = {
      id1 ?? "": "1",
      id2 ?? "": "2",
      id3 ?? "": "3",
      id4 ?? "": "4",
      id7 ?? "": "7",
      id8 ?? "": "8",
      id9 ?? "": "9",
      fullday ?? "": "full-day",
      firsthalf ?? "": "forenoon-halfday",
      secondhalf ?? "": "afternoon-halfday",
    };

    Map<String, String?> resultsessiondataa = {
      fullday ?? "": "full-day",
      firsthalf ?? "": "forenoon-halfday",
      secondhalf ?? "": "afternoon-halfday",
    };

    // Retrieve the ID corresponding to the given leave type
    String? id = leaveTypeToId[leaveType];
    String? sessionData = resultsessiondataa[resultsessiondata];
    print("ID corresponding to $leaveType: $id");

    print(sessionData);
    postLeaveTracker(id, sessionData, date, endDate, reason);
  }

  void postLeaveTracker(id, resultsessiondata, date, endDate, reason) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('access_token') ?? "";
    String domain = prefs.getString("domain") ?? "";

    try {
      final headers = {
        'Authorization': "Bearer $accessToken",
      };

      final body = {
        'essentials_leave_type_id': id,
        'leave_session': resultsessiondata,
        'start_date': date,
        'end_date': endDate,
        'reason': reason
      };
      // print(body);
      // print(id);
      // print(resultsessiondata);
      // print(date);
      // print(endDate);
      // print(reason);
      final response = await http.post(
        Uri.parse('$domain/api/hrm/leave/store'),
        headers: headers,
        body: body,
      );
      print(response.body);
      if (response.statusCode == 200) {
        // Handle successful sign-in here
      } else {
        throw Exception('Failed to sign in');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

//Leave Summery
  // Declare a global variable to store the pending leave count

  Future<void> fetchData() async {
    try {
      _isLoading = true;
      notifyListeners();
      print("isLoading");

      // Fetch data here

      // Simulating a delay of 2 seconds
      await Future.delayed(const Duration(milliseconds: 220));

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
