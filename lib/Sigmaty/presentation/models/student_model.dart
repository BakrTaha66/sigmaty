class StudentModel {
  String? name;
  String? email;
  String? phone;
  String? age;
  String? academicYear;
  String? departmentA;
  String? departmentB;
  String? school;

  StudentModel({
      required this.name,
      required this.email,
      required this.phone,
      required this.age,
      required this.academicYear,
      required this.departmentA,
      required this.departmentB,
      required this.school
  });

  StudentModel.fromJson(Map<String, dynamic> data) {
    name = data['name'];
    email = data['email'];
    phone = data['phone'];
    age = data['age'];
    academicYear = data['academicYear'];
    departmentA = data['departmentA'];
    departmentB = data['departmentB'];
    school = data['school'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['age'] = age;
    data['academicYear'] = academicYear;
    data['departmentA'] = departmentA;
    data['departmentB'] = departmentB;
    data['school']= school;
    return data;
  }
}
