import 'dart:developer';

class User {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String? phone;
  final String? gender;
  final String? image;
  final String? birthday;
  final String role;
  final String token;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.phone,
    this.gender,
    this.image,
    this.birthday,
    required this.role,
    required this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      phone: json['phone'],
      gender: json['gender'],
      image: json['image'],
      birthday: json['birthday'],
      role: json['role'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'phone': phone,
      'gender': gender,
      'image': image,
      'birthday': birthday,
      'role': role,
      'token': token,
    };
  }
}

void main() {
  Map<String, dynamic> jsonData = {
    "id": 1,
    "first_name": "admin",
    "last_name": "admin",
    "email": "admin@gmail.com",
    "phone": null,
    "gender": null,
    "image": null,
    "birthday": null,
    "role": "super-admin",
    "token": "119|owPY6wAEWmryJd2RdyzcaPuR9qJGb6dHs6q1jMgX"
  };

  User user = User.fromJson(jsonData);
  log('User: ${user.firstName} ${user.lastName}, Email: ${user.email}');
}
