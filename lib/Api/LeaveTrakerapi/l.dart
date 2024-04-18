import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zeekoihrm/model/LeaveTraker/leaveSummery.dart';

class Lapi extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  List<LeaveSummaryResponse> userLeave = [];

  List<LeaveSummaryResponse> leaveSummary = [];

  get leaveTypeMap => null;

  Future<void> getLeaveSummary(String startDate, String endDate) async {
    _isLoading = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('access_token') ?? "";
    String domain = prefs.getString("domain") ?? "";

    try {
      final headers = {
        'Authorization': "Bearer $accessToken",
      };
      Uri url = Uri.parse(
          '$domain/api/hrm/leave/summary?start_date=$startDate-01&end_date=$endDate');

      var response = await http.get(url, headers: headers);
      print('API Response: ${response.body}');
      if (response.statusCode == 200) {
        dynamic jsonData = jsonDecode(response.body);

        if (jsonData['success'] == true) {
          // Parse LeaveSummaryResponse from JSON
          LeaveSummaryResponse leaveSummaryResponse =
              LeaveSummaryResponse.fromJson(jsonData);

          // Add to userLeave list
          userLeave.add(leaveSummaryResponse);

          // Add to leaveSummary list
          leaveSummary.add(leaveSummaryResponse);
          // Print userLeave
          // Map of IDs to leave types
          final Map<String, String> leaveTypeMap = {
            "1": "Saturday Off",
            "2": "SICK LEAVE",
            "3": "Compensatory Off",
            "4": "Off",
            "7": "Annual Leave",
            "8": "Emergency",
            "9": "Earned"
          };

// Print userLeave
          print('User Leaves:');
          for (var leave in userLeave) {
            print('Success: ${leave.success}');
            print('User Leaves:');
            leave.userLeaves.forEach((key, value) {
              print('  Leave Type: ${leaveTypeMap[key]}, Value: $value');
            });
            print('Leaves Summary:');
            leave.leavesSummary.forEach((key, value) {
              print(
                  '  Leave Type: ${leaveTypeMap[key]}, Value: ${value.pending}');
            });
            print('---------------');
          }

// Print leaveSummary
          print('Leave Summary:');
          for (var leave in leaveSummary) {
            print('Success: ${leave.success}');
            print('User Leaves:');
            leave.userLeaves.forEach((key, value) {
              print('  Leave Type: ${leaveTypeMap[key]}, Value: $value');
            });
            print('Leaves Summary:');
            leave.leavesSummary.forEach((key, value) {
              print(
                  '  Leave Type: ${leaveTypeMap[key]}, approved: ${value.approved}');
            });
            print('---------------');
          }

          _isLoading = false;
          notifyListeners(); // Notify listeners that data has been updated
        } else {
          print('API Response indicates failure.');
        }
      } else {
        print('HTTP Request Failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
