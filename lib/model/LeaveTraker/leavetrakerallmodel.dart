class LeaveTrackerAllModel {
  final int id;
  final int essentialsLeaveTypeId;
  final String user;
  final String leaveType;
  final String startDate;
  final int userId;
  final int essentialsDepartmentId;
  final String endDate;
  final int isPaid;
  final String refNo;
  final String status;
  final String? supervisorStatus;
  final int? supervisorId;
  final String? supervisorUpdateDate;
  final int businessId;
  final String reason;
  final String leaveSession;
  final String? statusNote;
  final String? supervisorApproved;
  int? dateDifference; // Change here: Remove final and make it nullable

  LeaveTrackerAllModel({
    required this.id,
    required this.essentialsLeaveTypeId,
    required this.user,
    required this.leaveType,
    required this.startDate,
    required this.userId,
    required this.essentialsDepartmentId,
    required this.endDate,
    required this.isPaid,
    required this.refNo,
    required this.status,
    this.supervisorStatus,
    this.supervisorId,
    this.supervisorUpdateDate,
    required this.businessId,
    required this.reason,
    required this.leaveSession,
    this.statusNote,
    this.supervisorApproved,
    this.dateDifference,
  });

  factory LeaveTrackerAllModel.fromJson(Map<String, dynamic> json) {
    return LeaveTrackerAllModel(
      id: json['id'] ?? 0,
      essentialsLeaveTypeId: json['essentials_leave_type_id'] ?? 0,
      user: json['user'] ?? "",
      leaveType: json['leave_type'] ?? "",
      startDate: json['start_date'] ?? "",
      userId: json['user_id'] ?? 0,
      essentialsDepartmentId: json['essentials_department_id'] ?? 0,
      endDate: json['end_date'] ?? "",
      isPaid: json['is_paid'] ?? 0,
      refNo: json['ref_no'] ?? "",
      status: json['status'] ?? "",
      supervisorStatus: json['supervisor_status'],
      supervisorId: json['supervisor_id'],
      supervisorUpdateDate: json['supervisor_update_date'],
      businessId: json['business_id'] ?? 0,
      reason: json['reason'] ?? "",
      leaveSession: json['leave_session'] ?? "",
      statusNote: json['status_note'],
      supervisorApproved: json['supervisor_approved'],
    );
  }

  get leaveSummary => null;
}

void main() {
  try {
    List<Map<String, dynamic>> jsonDataList = [
      {
        "id": 7,
        "essentials_leave_type_id": 2,
        "user": " Anila ",
        "leave_type": "SICK LEAVE",
        "start_date": "2023-01-10",
        "user_id": 13,
        "essentials_department_id": 20,
        "end_date": "2023-01-12",
        "is_paid": 0,
        "ref_no": "2023/0007",
        "status": "approved",
        "supervisor_status": null,
        "supervisor_id": null,
        "supervisor_update_date": null,
        "business_id": 3,
        "reason": "medical check up",
        "leave_session": "full-day",
        "status_note": null,
        "supervisor_approved": null
      },
      // Add more data as needed
    ];

    List<LeaveTrackerAllModel> attendanceList = jsonDataList
        .map((json) => LeaveTrackerAllModel.fromJson(json))
        .toList();

    if (attendanceList.isNotEmpty) {
      for (var data in attendanceList) {
        // Parse dates
        DateTime startDate = DateTime.parse(data.startDate);
        DateTime endDate = DateTime.parse(data.endDate);

        // Calculate difference
        Duration difference = endDate.difference(startDate);

        // Print the difference
        print(
            'ID: ${data.id}, User: ${data.user}, Leave Type: ${data.leaveType}, Duration: ${difference.inDays} days');
      }
    } else {
      print('No attendance data found.');
    }
  } catch (e, stackTrace) {
    print('Error: $e');
    print('StackTrace: $stackTrace');
  }
}
