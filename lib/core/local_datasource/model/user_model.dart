import 'dart:convert';

import 'package:project_test/core/local_datasource/secure_storage_methods.dart';

class UserModel {
  final String name;
  final String email;
  UserModel({
    required this.name,
    required this.email,
  });

  Map<String, dynamic> _toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    result.addAll({'email': email});

    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
    );
  }

  @override
  String toString() => 'UserModel(name: $name, email: $email)';

  static Future<UserModel> getFromCache() async {
    final modelCache = await storage.getValue(key: 'teste');
    final data = UserModel.fromMap(jsonDecode(modelCache!));
    return data;
  }

  Future<void> saveInCache() async {
    await storage.save(key: 'teste', value: jsonEncode(_toMap()));
  }
}
