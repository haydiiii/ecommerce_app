
// Main class for the response
class ApiResponse {
  bool success;
  String msg;
  UserData data;

  ApiResponse({
    required this.success,
    required this.msg,
    required this.data,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      success: json['success'],
      msg: json['msg'],
      data: UserData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'msg': msg,
      'data': data.toJson(),
    };
  }
}

// Class for user data
class UserData {
  int id;
  String firstName;
  String lastName;
  String email;
  String? phone;
  String? imageUrl;
  String role;

  UserData({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.phone,
    this.imageUrl,
    required this.role,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      phone: json['phone'],
      imageUrl: json['image_url'],
      role: json['role'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'phone': phone,
      'image_url': imageUrl,
      'role': role,
    };
  }
}

