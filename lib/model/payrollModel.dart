import 'dart:convert';

class PayrollMode {
  int? id;
  String? transactionDate;
  String? finalTotal;
  String? essentialsDuration;
  String? essentialsDurationUnit;
  String? essentialsAmountPerUnitDuration;
  List<Map<String, dynamic>>? essentialsAllowances;
  List<Map<String, dynamic>>? essentialsDeductions;
  Map<String, dynamic>? essentialsOthers;

  PayrollMode({
    this.id,
    this.transactionDate,
    this.finalTotal,
    this.essentialsDuration,
    this.essentialsDurationUnit,
    this.essentialsAmountPerUnitDuration,
    this.essentialsAllowances,
    this.essentialsDeductions,
    this.essentialsOthers,
  });

  factory PayrollMode.fromJson(Map<String, dynamic> json) {
    return PayrollMode(
      id: json['date']['id'],
      transactionDate: json['transaction_date'],
      finalTotal: json['date']?['final_total'] ?? "",
      essentialsDuration: json['essentials_duration'] ?? "",
      essentialsDurationUnit: json['essentials_duration_unit'] ?? "",
      essentialsAmountPerUnitDuration:
          json['date']?['essentials_amount_per_unit_duration'] ?? "",
      essentialsAllowances:
          parseJsonArray(json['date']?['essentials_allowances']),
      essentialsDeductions:
          parseJsonArray(json['date']?['essentials_deductions']),
      essentialsOthers: json['essentials_others'] != null
          ? Map<String, dynamic>.from(json['essentials_others'])
          : null,
    );
  }

  static List<Map<String, dynamic>>? parseJsonArray(String? jsonArrayString) {
    if (jsonArrayString == null) return null;
    dynamic decodedJson = json.decode(jsonArrayString);
    if (decodedJson is Map<String, dynamic>) {
      List<Map<String, dynamic>> result = [];
      result.add(decodedJson); // Add the decoded JSON directly
      return result;
    } else {
      // Handle other cases if needed
      return null;
    }
  }
}
