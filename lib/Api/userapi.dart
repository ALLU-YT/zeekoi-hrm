import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zeekoihrm/model/memomodel.dart';
import 'package:zeekoihrm/model/usermodel.dart';

class UserProfile extends ChangeNotifier {
  String? rFirstName;
  String? rDesagination;
  String? rEmail;
  String? rContactNumber;

  String? firstName;
  String? email;
  String? fullname;
  String? Profile;
  String? mobile;
  String? dob;
  String? gender;
  String? basicSalary;
  String? designation;
  String? department; // Change the type to Department?
  List<MemoModel> memoModelList = [];
  void getFirstName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('access_token') ?? "";
    String domain = prefs.getString("domain") ?? "";

    try {
      final headers = {
        'Authorization': "Bearer $accessToken",
      };

      Uri url = Uri.parse('$domain/api/user');
      var response = await http.get(url, headers: headers);
      // print(response.body);

      if (response.statusCode == 200) {
        User user = User.fromJson(jsonDecode(response.body));

        firstName = user.firstName;

        notifyListeners();
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  void getfullname() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('access_token') ?? "";
    String domain = prefs.getString("domain") ?? "";

    try {
      final headers = {
        'Authorization': "Bearer $accessToken",
      };

      Uri url = Uri.parse('$domain/api/user');
      var response = await http.get(url, headers: headers);
      // print(response.body);

      if (response.statusCode == 200) {
        User user = User.fromJson(jsonDecode(response.body));

        fullname = user.fullName;

        notifyListeners();
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  void getEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('access_token') ?? "";
    String domain = prefs.getString("domain") ?? "";

    try {
      final headers = {
        'Authorization': "Bearer $accessToken",
      };

      Uri url = Uri.parse('$domain/api/user');
      var response = await http.get(url, headers: headers);
      // print(response.body);

      if (response.statusCode == 200) {
        User user = User.fromJson(jsonDecode(response.body));

        email = user.email;

        notifyListeners();
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  void getPhoneNumber() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('access_token') ?? "";
    String domain = prefs.getString("domain") ?? "";

    try {
      final headers = {
        'Authorization': "Bearer $accessToken",
      };

      Uri url = Uri.parse('$domain/api/user');
      var response = await http.get(url, headers: headers);
      // print(response.body);

      if (response.statusCode == 200) {
        User user = User.fromJson(jsonDecode(response.body));

        mobile = user.mobile;

        notifyListeners();
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  void getProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('access_token') ?? "";
    String domain = prefs.getString("domain") ?? "";

    try {
      final headers = {
        'Authorization': "Bearer $accessToken",
      };

      Uri url = Uri.parse('$domain/api/user');
      var response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        User user = User.fromJson(jsonDecode(response.body));

        Profile = user.profileImage;

        notifyListeners();
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  void getDob() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('access_token') ?? "";
    String domain = prefs.getString("domain") ?? "";

    try {
      final headers = {
        'Authorization': "Bearer $accessToken",
      };

      Uri url = Uri.parse('$domain/api/user');
      var response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        User user = User.fromJson(jsonDecode(response.body));

        dob = user.dob;

        notifyListeners();
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  void getGender() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('access_token') ?? "";
    String domain = prefs.getString("domain") ?? "";

    try {
      final headers = {
        'Authorization': "Bearer $accessToken",
      };

      Uri url = Uri.parse('$domain/api/user');
      var response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        User user = User.fromJson(jsonDecode(response.body));

        gender = user.gender;

        notifyListeners();
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  void getDepartment() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('access_token') ?? "";
    String domain = prefs.getString("domain") ?? "";

    try {
      final headers = {
        'Authorization': "Bearer $accessToken",
      };

      Uri url = Uri.parse('$domain/api/user');
      var response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        User user = User.fromJson(jsonDecode(response.body));

        department = user.department;
        // print(department);
        notifyListeners();
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  void getDesagination() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('access_token') ?? "";
    String domain = prefs.getString("domain") ?? "";

    try {
      final headers = {
        'Authorization': "Bearer $accessToken",
      };

      Uri url = Uri.parse('$domain/api/user');
      var response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        User user = User.fromJson(jsonDecode(response.body));

        designation = user.designation;

        notifyListeners();
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  void getBasicSalary() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('access_token') ?? "";
    String domain = prefs.getString("domain") ?? "";

    try {
      final headers = {
        'Authorization': "Bearer $accessToken",
      };

      Uri url = Uri.parse('$domain/api/user');
      var response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        User user = User.fromJson(jsonDecode(response.body));

        basicSalary = user.basicSalary;

        notifyListeners();
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  //memo
  void getMemo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('access_token') ?? "";
    String domain = prefs.getString("domain") ?? "";

    try {
      final headers = {
        'Authorization': "Bearer $accessToken",
      };

      Uri url = Uri.parse('$domain/api/memo/get');
      var response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        dynamic jsonData = jsonDecode(response.body);

        if (jsonData['success'] == true && jsonData.containsKey('data')) {
          List<dynamic> dataList = jsonData['data'];
          memoModelList = dataList
              .map((json) => MemoModel.fromJson(json as Map<String, dynamic>))
              .toList();

          // Print the fetched memo data
          // for (var memo in memoModelList) {
          //   print('Name: ${memo.name}');
          //   print('Description: ${memo.description}');
          //   print('-----------------------------');
          // }

          // Notify listeners after processing the data successfully
          notifyListeners();
        } else {
          print('Request failed with status: ${response.statusCode}');
        }
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  void UpdateUserProfile(File img, String firstName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('access_token') ?? "";
    String domain = prefs.getString("domain") ?? "";
    final url = Uri.parse('$domain/api/user');

    final headers = {'Authorization': 'Bearer $accessToken'};
    var request = http.MultipartRequest('POST', url);
    request.fields.addAll({
      'first_name': firstName,
    });
    print(firstName);
    request.files
        .add(await http.MultipartFile.fromPath('profile_photo', img.path));
    request.headers.addAll(headers);
    print(request.files);
    http.StreamedResponse response = await request.send();
    print(await response.stream.bytesToString());
    // check_clock_in();
    // var data = jsonDecode(await response.stream.bytesToString());
    // print(data);
  }

  void requestFilesAndMediaPermission(BuildContext context) async {
    print("ob");
    PermissionStatus permissionStatus = await Permission.storage.status;
    if (permissionStatus.isDenied || permissionStatus.isPermanentlyDenied) {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text("Permission Required"),
          content: const Text("This app needs access to files and media."),
          actions: <Widget>[
            TextButton(
              child: const Text("Cancel"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: const Text("Open Settings"),
              onPressed: () {
                openAppSettings();
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    } else if (permissionStatus.isPermanentlyDenied) {
      await Permission.storage.request();
    }
  }

//reporting

  void getReporting() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('access_token') ?? "";
    String domain = prefs.getString("domain") ?? "";

    try {
      final headers = {
        'Authorization': "Bearer $accessToken",
      };
      print("object");
      Uri url = Uri.parse('$domain/api/user/reportingTo');
      var response = await http.get(url, headers: headers);
      print(response.body);

      if (response.statusCode == 200) {
        ReportingModel report =
            ReportingModel.fromJson(jsonDecode(response.body));

        rFirstName = report.firstName;
        print(rFirstName);
        rEmail = report.email;
        rContactNumber = report.contactNumber;
        rDesagination = report.designation;

        notifyListeners();
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
