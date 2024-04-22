import 'package:dr_scan_graduation_project/core/utils/enums.dart';

class UserModel {
  UserModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.isSmoker,
    required this.gender,
    required this.password,
    required this.birthDate,
    required this.confirmPassword,
    this.disease,
  });
  final String name;
  final String email;
  final String phone;
  final bool isSmoker;
  final Gender gender;
  final String? disease;
  final String password;
  final String birthDate;
  final String confirmPassword;

  UserModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'],
        password = json['password'],
        confirmPassword = json['C_password'],
        isSmoker = json['smoke'] == 1 ? true : false,
        phone = json['mobile'],
        birthDate = json['age'],
        disease = json['disease'],
        gender = json['gender'] == 1 ? Gender.male : Gender.female;

  toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'C_password': confirmPassword,
      'smoke': isSmoker == true ? 1 : 0,
      'mobile': phone,
      'gender': gender == Gender.male ? 1 : 0,
      'disease': disease,
      'age': birthDate,
    };
  }

  // void setTokens(String accessToken) {
  //   this.accessToken = accessToken;
  // }
}
