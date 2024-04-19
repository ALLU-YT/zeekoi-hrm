import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:open_file/open_file.dart';
// import 'package:html/parser.dart' as parser;
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
          deductionTotal = 0.00;
          totalAmount = 0.00;

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

  Future<String?> getPdf(id1) async {
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
        return response.body; // Return HTML content
      } else {
        print('Request failed with status: ${response.statusCode}');
        return null; // Return null if request fails
      }
    } catch (e) {
      print('Error: $e');
      return null; // Return null if error occurs
    }
  }

  Future<void> downloadAndOpenPdf() async {
    // Fetch HTML content from API
    String? htmlContent = await getPdf(id1);

    if (htmlContent != null) {
      try {
        // Get directory path for saving PDF
        final directory =
            await getExternalStorageDirectory(); // or getApplicationDocumentsDirectory()
        final filePath = '${directory!.path}/example.pdf';

        // Save PDF file
        final pdfFile = File(filePath);
        await pdfFile.writeAsString(htmlContent);

        // Print the path where the PDF is saved
        print('PDF saved at: $filePath');

        // Open the saved PDF file
        OpenFile.open(filePath);
      } catch (e) {
        print('Error saving or opening PDF: $e');
      }
    } else {
      print('Failed to fetch HTML content');
    }
  }

  void main() {
    downloadAndOpenPdf();
  }

  Future<void> fetchData() async {
    try {
      _isLoading = true;
      notifyListeners();
      print("isLoading");

      // Fetch data here

      // Simulating a delay of 2 seconds
      await Future.delayed(const Duration(seconds: 4));

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
