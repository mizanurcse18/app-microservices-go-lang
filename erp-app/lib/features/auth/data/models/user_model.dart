import 'package:erp_app/features/auth/domain/entities/user.dart';

class UserModel extends User {
  final bool active;
  final String role;

  const UserModel({
    required super.id,
    required super.email,
    required this.role,
    required this.active,
    super.name,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id']?.toString() ?? '',
      email: json['username'] ?? '',
      role: json['role'] ?? '',
      active: json['active'] ?? false,
      name: json['name'], // name is not in the user object but might be needed later
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': email,
      'role': role,
      'active': active,
    };
  }
}

class LoginResponseModel {
  final String accessToken;
  final String refreshToken;
  final UserModel user;

  LoginResponseModel({
    required this.accessToken,
    required this.refreshToken,
    required this.user,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      accessToken: json['access_token'],
      refreshToken: json['refresh_token'],
      user: UserModel.fromJson(json['user']),
    );
  }
}

class LoginRequestModel {
  final String username;
  final String password;

  LoginRequestModel({required this.username, required this.password});

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
    };
  }
}
