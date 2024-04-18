class LeaveTrackerSummery {
  String? s1;
  String? s2;
  String? s3;
  String? s4;
  String? s7;
  String? s8;
  String? s9;
  String? fullDay;
  String? forenoonHalfday;
  String? afternoonHalfday;

  LeaveTrackerSummery({
    this.s1,
    this.s2,
    this.s3,
    this.s4,
    this.s7,
    this.s8,
    this.s9,
    this.fullDay,
    this.forenoonHalfday,
    this.afternoonHalfday,
  });

  factory LeaveTrackerSummery.fromJson(Map<String, dynamic> json) {
    return LeaveTrackerSummery(
      s1: json['types']['1'],
      s2: json['types']['2'],
      s3: json['types']['3'],
      s4: json['types']['4'],
      s7: json['types']['7'],
      s8: json['types']['8'],
      s9: json['types']['9'],
      fullDay: json['session']['full-day'],
      forenoonHalfday: json['session']['forenoon-halfday'],
      afternoonHalfday: json['session']['afternoon-halfday'],
    );
  }
}
