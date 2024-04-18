class Attendance {
  bool? success;
  String? msg;
  String? type;
  String? clockInTime;
  String? currentShift;

  Attendance(
      {this.success, this.msg, this.type, this.clockInTime, this.currentShift});

  Attendance.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    msg = json['msg'];
    type = json['type'];
    clockInTime = json['clock_in_time'];
    currentShift = json['current_shift'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['msg'] = msg;
    data['type'] = type;
    data['clock_in_time'] = clockInTime;
    data['current_shift'] = currentShift;
    return data;
  }
}
