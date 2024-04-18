class BirthdayModel {
  int id;
  String email;
  String name;
  String img;
  int inDays;

  BirthdayModel({
    required this.id,
    required this.email,
    required this.name,
    required this.img,
    required this.inDays,
  });

  factory BirthdayModel.fromJson(Map<String, dynamic> json) {
    return BirthdayModel(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      img: json['img'],
      inDays: json['in_days'],
    );
  }

  bool isUpcoming() {
    return inDays > 0;
  }
}
