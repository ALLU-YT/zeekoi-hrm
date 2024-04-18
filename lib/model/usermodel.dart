class User {
  int? id;
  String? fullName;
  String? surname;
  String? firstName;
  String? lastName;
  String? mobile;
  String? email;
  String? language;
  String? contactNo;
  String? address;
  int? allowLogin;
  String? status;
  String? employeeId;
  String? dob;
  String? department;
  String? designation;
  String? gender;
  String? basicSalary;
  String? role;
  BankDetails? bankDetails;
  String? profileImage;

  User(
      {this.id,
      this.fullName,
      this.surname,
      this.firstName,
      this.lastName,
      this.mobile,
      this.email,
      this.language,
      this.contactNo,
      this.address,
      this.allowLogin,
      this.status,
      this.employeeId,
      this.dob,
      this.department,
      this.designation,
      this.gender,
      this.basicSalary,
      this.role,
      this.bankDetails,
      this.profileImage});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        firstName: json['user']['first_name'],
        email: json['user']['email'],
        profileImage: json['user']['profile_image'],
        fullName: json['user']['full_name'],
        mobile: json['user']['mobile'],
        dob: json['user']['dob'],
        gender: json['user']['gender'],
        basicSalary: json['user']['basic_salary'],
        department: json['user']['department']['name'],
        designation: json['user']['designation']['name']);
  }

  // User.fromJson(Map<String, dynamic> json) {
  //   id = json['id'];
  //   fullName = json['full_name'];
  //   surname = json['surname'];
  //   firstName = json['first_name'];
  //   lastName = json['last_name'];
  //   mobile = json['mobile'];
  //   email = json['email'];
  //   language = json['language'];
  //   contactNo = json['contact_no'];
  //   address = json['address'];
  //   allowLogin = json['allow_login'];
  //   status = json['status'];
  //   employeeId = json['employee_id'];
  //   dob = json['dob'];
  //   department = json['department'] != null
  //       ? Department.fromJson(json['department'])
  //       : null;
  //   designation = json['designation'] != null
  //       ? Department.fromJson(json['designation'])
  //       : null;
  //   gender = json['gender'];
  //   basicSalary = json['basic_salary'];
  //   role = json['role'];
  //   bankDetails = json['bank_details'] != null
  //       ? BankDetails.fromJson(json['bank_details'])
  //       : null;
  //   profileImage = json['profile_image'];
  // }

  Object? toJson() {
    return null;
  }
}

class Department {
  String? name;

  Department({this.name});

  Department.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    return data;
  }
}

class BankDetails {
  void accountHolderName;
  void accountNumber;
  void bankName;
  void bankCode;
  void branch;
  void taxPayerId;

  BankDetails(
      {this.accountHolderName,
      this.accountNumber,
      this.bankName,
      this.bankCode,
      this.branch,
      this.taxPayerId});

  BankDetails.fromJson(Map<String, dynamic> json) {
    accountHolderName = json['account_holder_name'];
    accountNumber = json['account_number'];
    bankName = json['bank_name'];
    bankCode = json['bank_code'];
    branch = json['branch'];
    taxPayerId = json['tax_payer_id'];
  }
}

class Permissions {
  bool? projectCreateTask;
  bool? projectEditTask;
  bool? leadList;
  bool? leadAssignUsers;
  bool? followupAssignUsers;

  Permissions(
      {this.projectCreateTask,
      this.projectEditTask,
      this.leadList,
      this.leadAssignUsers,
      this.followupAssignUsers});

  Permissions.fromJson(Map<String, dynamic> json) {
    projectCreateTask = json['project.create_task'];
    projectEditTask = json['project.edit_task'];
    leadList = json['lead.list'];
    leadAssignUsers = json['lead.assign_users'];
    followupAssignUsers = json['followup.assign_users'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['project.create_task'] = projectCreateTask;
    data['project.edit_task'] = projectEditTask;
    data['lead.list'] = leadList;
    data['lead.assign_users'] = leadAssignUsers;
    data['followup.assign_users'] = followupAssignUsers;
    return data;
  }
}

class AppVersions {
  String? zcrm;
  String? ztrack;
  String? zone;
  String? zdash;

  AppVersions({this.zcrm, this.ztrack, this.zone, this.zdash});

  AppVersions.fromJson(Map<String, dynamic> json) {
    zcrm = json['zcrm'];
    ztrack = json['ztrack'];
    zone = json['zone'];
    zdash = json['zdash'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['zcrm'] = zcrm;
    data['ztrack'] = ztrack;
    data['zone'] = zone;
    data['zdash'] = zdash;
    return data;
  }
}

class ReportingModel {
  final int id;
  final String surname;
  final String firstName;
  final String? lastName; // Nullable string
  final String email;
  final String? contactNumber; // Nullable string
  final String? designation; // Nullable string
  final String? media; // Nullable string

  ReportingModel({
    required this.id,
    required this.surname,
    required this.firstName,
    required this.email,
    this.lastName,
    this.contactNumber,
    this.designation,
    this.media,
  });

  factory ReportingModel.fromJson(Map<String, dynamic> json) {
    return ReportingModel(
      id: json['data']['id'] ?? 0, // Provide a default value for id if null
      surname: json['data']['surname'] ?? "",
      firstName: json['data']['first_name'] ?? "",
      lastName: json['data']['last_name'],
      email: json['data']['email'] ?? "",
      contactNumber: json['data']['contact_number'],
      designation: json['data']['designation'],
      media: json['data']['media'],
    );
  }
}
