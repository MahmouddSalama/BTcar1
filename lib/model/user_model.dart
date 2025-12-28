


class UserModel {
  final String name;
  final String age;
  final String email;
  final String password;
  final bool admin;
  final String phone;
  final String id;

  UserModel({
    required this.id,
    required this.phone,
    required this.name,
    required this.age,
    required this.email,
    required this.password,
    required this.admin,
  });

  factory UserModel.fromJson(jsonData) {
    return UserModel(
      id: jsonData['id'],
      phone:jsonData ['phone'],
      name: jsonData['name'],
      age: jsonData['age'],
      email: jsonData['email'],
      password: jsonData['password'],
      admin: jsonData['admin'],
    );
  }
}
