class Shift {
  String name;
  String? shortName;
  String startTime;
  String endTime;
  String intervalStartTime;
  int? intervalDurationMin; // Change type to int?
  String? color;

  Shift({
    required this.name,
    this.shortName,
    required this.startTime,
    required this.endTime,
    required this.intervalStartTime,
    this.intervalDurationMin,
    this.color,
  });

  factory Shift.fromJson(Map<String, dynamic> json) {
    return Shift(
      name: json['name'],
      shortName: json['short_name'],
      startTime: json['start_time'],
      endTime: json['end_time'],
      intervalStartTime: json['interval_start_time'],
      intervalDurationMin: json['interval_duration_min'] != null
          ? int.tryParse(json['interval_duration_min'].toString())
          : null,
      color: json['color'],
    );
  }
}

class ClockStatus {
  bool success;
  bool isPhotoRequired;
  bool clockedInStatus;
  String clockInTime;
  Shift shift;
  String msg;

  ClockStatus({
    required this.success,
    required this.isPhotoRequired,
    required this.clockedInStatus,
    required this.clockInTime,
    required this.shift,
    required this.msg,
  });

  factory ClockStatus.fromJson(Map<String, dynamic> json) {
    return ClockStatus(
      success: json['success'],
      isPhotoRequired: json['is_photo_required'],
      clockedInStatus: json['clocked_in_status'],
      clockInTime: json['clock_in_time'],
      shift: Shift.fromJson(json['shift']),
      msg: json['msg'],
    );
  }
}
