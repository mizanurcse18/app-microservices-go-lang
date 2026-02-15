import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../models/user_model.dart';

abstract class AuthLocalDataSource {
  Future<void> saveTokens({required String access, required String refresh});
  Future<void> saveUser(UserModel user);
  Future<String?> getAccessToken();
  Future<void> clear();
  Future<void> saveLastEmail(String email);
  Future<String?> getLastEmail();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final FlutterSecureStorage _storage;
  static const String _accessKey = 'access_token';
  static const String _refreshKey = 'refresh_token';
  static const String _userKey = 'user_data';
  static const String _emailKey = 'last_email';

  AuthLocalDataSourceImpl(this._storage);

  @override
  Future<void> saveTokens({required String access, required String refresh}) async {
    await _storage.write(key: _accessKey, value: access);
    await _storage.write(key: _refreshKey, value: refresh);
  }

  @override
  Future<void> saveUser(UserModel user) async {
    final userJson = jsonEncode(user.toJson());
    await _storage.write(key: _userKey, value: userJson);
  }

  @override
  Future<String?> getAccessToken() async {
    return await _storage.read(key: _accessKey);
  }

  @override
  Future<void> clear() async {
    await _storage.delete(key: _accessKey);
    await _storage.delete(key: _refreshKey);
    await _storage.delete(key: _userKey);
  }

  @override
  Future<void> saveLastEmail(String email) async {
    await _storage.write(key: _emailKey, value: email);
  }

  @override
  Future<String?> getLastEmail() async {
    return await _storage.read(key: _emailKey);
  }
}
