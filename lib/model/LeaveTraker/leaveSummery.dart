class LeaveSummaryResponse {
  final bool success;
  final Map<String, dynamic> userLeaves;
  final Map<String, LeaveDetail>
      leavesSummary; // Change the value type to LeaveDetail

  LeaveSummaryResponse({
    required this.success,
    required this.userLeaves,
    required this.leavesSummary,
  });

  factory LeaveSummaryResponse.fromJson(Map<String, dynamic> json) {
    // Parse user leaves
    Map<String, dynamic> userLeavesJson = json['userLeaves'];
    Map<String, dynamic> parsedUserLeaves = {};
    userLeavesJson.forEach((key, value) {
      parsedUserLeaves[key] = {'year': value['year']};
    });

    // Parse leaves summary
    Map<String, dynamic> leavesSummaryJson = json['leaves_summary'];
    Map<String, LeaveDetail> parsedLeavesSummary = {};
    leavesSummaryJson.forEach((key, value) {
      parsedLeavesSummary[key] = LeaveDetail.fromJson(value);
    });

    return LeaveSummaryResponse(
      success: json['success'],
      userLeaves: parsedUserLeaves,
      leavesSummary: parsedLeavesSummary,
    );
  }
}

class LeaveDetail {
  final double? lop;
  final double? approved;
  final double pending;

  LeaveDetail({
    this.lop,
    this.approved,
    required this.pending,
  });

  factory LeaveDetail.fromJson(Map<String, dynamic> json) {
    return LeaveDetail(
      lop:
          json['lop']?.toDouble(), // Use ?.toDouble() to handle nullable values
      approved: json['approved']?.toDouble(),
      pending: json['pending'].toDouble(),
    );
  }
}
