import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:pdf/widgets.dart' as pw;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zeekoihrm/model/payrollModel.dart';

class GetPayRollApiProvider extends ChangeNotifier {
  List<PayrollMode> payrollList = [];
  List<PayrollMode> deductionList = [];
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String? amount;
  double totalAmount = 0.0;
  double deductionTotal = 0.00; // Define deductionTotal field
  String? basicSalary;
  int? id1;
  Future<void> getPayRollApiProvider(currentMonth, year) async {
    _isLoading = true;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('access_token') ?? "";
    String domain = prefs.getString("domain") ?? "";

    try {
      final headers = {
        'Authorization': "Bearer $accessToken",
      };

      Uri url =
          Uri.parse('$domain/api/hrm/payroll?year=$currentMonth&month=$year');

      var response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        dynamic jsonData = jsonDecode(response.body);

        if (jsonData != null && jsonData.isNotEmpty) {
          // Clear previous data if any
          payrollList.clear();
          deductionList.clear();
          basicSalary = "0.00";
          amount = "0.00";
          if (jsonData is List) {
            payrollList =
                jsonData.map((json) => PayrollMode.fromJson(json)).toList();
          } else if (jsonData is Map<String, dynamic>) {
            payrollList = [PayrollMode.fromJson(jsonData)];
          }

          totalAmount = 0.00;
          deductionTotal = 0.00;

          for (var payroll in payrollList) {
            double payrollAmount =
                double.parse(payroll.essentialsAmountPerUnitDuration ?? '0.0');
            amount = payroll.finalTotal;
            basicSalary = payroll.essentialsAmountPerUnitDuration ?? '0.000';
            id1 = payroll.id;

            print(id1);

            totalAmount += payrollAmount;

            if (payroll.essentialsAllowances != null) {
              for (var allowance in payroll.essentialsAllowances!) {
                for (var i = 0; i < allowance['allowance_names'].length; i++) {
                  double allowanceAmount = double.parse(
                      allowance['allowance_amounts'][i].toString());

                  totalAmount += allowanceAmount;
                }
              }
            }
          }

          // Deduction calculation
          if (jsonData is List) {
            deductionList =
                jsonData.map((json) => PayrollMode.fromJson(json)).toList();
          } else if (jsonData is Map<String, dynamic>) {
            deductionList = [PayrollMode.fromJson(jsonData)];
          }

          for (var payroll in deductionList) {
            if (payroll.essentialsDeductions != null) {
              for (var deduction in payroll.essentialsDeductions!) {
                for (var i = 0; i < deduction['deduction_names'].length; i++) {
                  String deductionName =
                      deduction['deduction_names'][i].toString();
                  double deductionAmount = double.parse(
                      deduction['deduction_amounts'][i].toString());
                  deductionTotal += deductionAmount;
                  print(deductionName);
                }
              }
            }
          }
        }
      } else {
        // Handle API error
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> getPdf(String id1) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('access_token') ?? "";
    String domain = prefs.getString("domain") ?? "";

    try {
      final headers = {
        'Authorization': "Bearer $accessToken",
      };

      Uri url = Uri.parse('$domain/api/hrm/payroll/show/$id1');
      var response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        var pdfBytes = response.bodyBytes;

        // Provide the PDF bytes as response for downloading
        final appDocDir = await getApplicationDocumentsDirectory();
        final pdfFile = File('${appDocDir.path}/example.pdf');
        await pdfFile.writeAsBytes(pdfBytes);

        // Open the PDF file
        OpenFile.open(pdfFile.path);
        print(pdfFile.path);
      } else {
        print('Request failed with status: ${response.statusCode}');
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
