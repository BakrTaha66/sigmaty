class TeacherModel {
  String? name;
  String? email;
  String? phone;
  String? department;
  String? subject;
  List<String>? academicYear;
  String? status;

  TeacherModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.department,
    required this.subject,
    required this.academicYear,
    required this.status,
  });

  TeacherModel.fromJson(Map<String, dynamic> data) {
    name = data['name'];
    email = data['email'];
    phone = data['phone'];
    department = data['department'];
    subject = data['subject'];
    academicYear = data['academicYear'];
    status = data['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['department'] = department;
    data['subject'] = subject;
    data['academicYear'] = academicYear;
    data['status'] = status;
    return data;
  }
}
