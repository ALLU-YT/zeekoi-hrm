import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zeekoihrm/model/birthdaymodel.dart';
import 'package:zeekoihrm/model/checkClockinModel.dart';

class CheckedIn extends ChangeNotifier {
  final bool _isLoading = false;
  bool get isLoading => _isLoading;
  Location location = Location();
  bool? _serviceEnabled;
  PermissionStatus? _permissionGranted;
  File? selectedImage;
  List<void>? todaysBirthdays;
  String? attendancedate;
  String? clockInTime;
  String? delayTime;
  String? clockOut;
  String? earlytime;
  String? shift;
  List<dynamic> data = [];
  String? startTimee;
  String? endTime;
  String? nameShift;
  List<BirthdayModel> birthdayList = [];
  int totalNumberOfTodayBirthdays = 0;
  String? timeOnly;

  //Location Accesss
  Future<void> initialize(BuildContext context) async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled!) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled!) {
        return;
      }
    }

    do {
      _permissionGranted = await location.hasPermission();
      if (_permissionGranted == PermissionStatus.denied) {
        _permissionGranted = await location.requestPermission();
        if (_permissionGranted == PermissionStatus.denied) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Location Permission Required"),
                content:
                    const Text("Please grant location permission to continue."),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      SystemNavigator.pop(); // Close the app
                    },
                    child: const Text("OK"),
                  ),
                ],
              );
            },
          );
          return; // Return from the method after showing the dialog
        }
      }
    } while (_permissionGranted != PermissionStatus.granted);

    notifyListeners();
  }

// ipadress
  Future<String> getIp() async {
    var response = await http.get(Uri.parse("https://api.ipify.org/"));
    String ipAddress = response.body;

    return ipAddress;
  }

  //CheckClockIn or not
  bool? checkclockin;
  void CheckClockInorNot() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('access_token') ?? "";
    String domain = prefs.getString("domain") ?? "";

    try {
      final headers = {
        'Authorization': "Bearer $accessToken",
      };

      Uri url = Uri.parse('$domain/api/attendance/check-clockin');
      var response = await http.get(url, headers: headers);
      // print(response.body);
      if (response.statusCode == 200) {
        ClockStatus clockStatus =
            ClockStatus.fromJson(jsonDecode(response.body));

        startTimee = clockStatus.shift.startTime;
        endTime = clockStatus.shift.endTime;
        nameShift = clockStatus.shift.name;
        String clockInTime = clockStatus
            .clockInTime; // Assuming clockStatus is your ClockStatus object

// Split the time string based on the space
        List<String> timeParts = clockInTime.split(' ');

// Extract the time part
        timeOnly = timeParts[1];

        print(timeOnly); // This will print the time portion without the date

        print(startTimee);
        // Do something with startTime
      } else {
        // Handle other status codes if needed
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  void clockInfn(
      String clockType, File img, Position position, String ip) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('access_token') ?? "";
    String domain = prefs.getString("domain") ?? "";
    final url = Uri.parse('$domain/api/attendance/clockin-clockout');

    final headers = {'Authorization': 'Bearer $accessToken'};
    var request = http.MultipartRequest('POST', url);
    request.fields.addAll({
      'clock_in_out_location': '${position.latitude},${position.longitude}',
      'type': clockType,
      'ip_address': ip,
      'clock_in_note': '',
      'clock_out_note': ''
    });

    request.files
        .add(await http.MultipartFile.fromPath('user_uploaded_img', img.path));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    print(await response.stream.bytesToString());
    // check_clock_in();
    // var data = jsonDecode(await response.stream.bytesToString());
    // print(data);
  }
}
