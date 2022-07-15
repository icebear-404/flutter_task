import 'dart:convert';

class User {
  final String createdAt;
  final String avatar;
  final String email;
  final String password;
  final String id;

  const User({
    required this.createdAt,
    required this.avatar,
    required this.email,
    required this.password,
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'createdAt': createdAt,
      'avatar': avatar,
      'email': email,
      'password': password,
      'id': id,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      createdAt: map['createdAt'] ?? '',
      avatar: map['avatar'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      id: map['id'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
