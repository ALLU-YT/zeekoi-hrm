import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zeekoihrm/model/LeaveTraker/leavetrakerallmodel.dart';

class LeaveReq extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  List<LeaveTrackerAllModel> leavetrackerlist = [];

  //s
  Future<void> leaveReq() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('access_token') ?? "";
    String domain = prefs.getString("domain") ?? "";

    try {
      final headers = {
        'Authorization': "Bearer $accessToken",
      };
      Uri url = Uri.parse('$domain/api/hrm/leave');
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
            data.dateDifference = difference.inDays;
            // print('-----------------------------');
            data.dateDifference =
                difference.inDays + 1; // Adding 1 to the date difference
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
}
