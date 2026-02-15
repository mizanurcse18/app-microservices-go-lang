import 'package:erp_app/features/auth/domain/entities/user.dart';
import 'package:erp_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:erp_app/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:erp_app/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:erp_app/features/auth/data/models/user_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;

  AuthRepositoryImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<User> login(String username, String password) async {
    try {
      final request = LoginRequestModel(username: username, password: password);
      final response = await _remoteDataSource.login(request);
      
      // Save tokens and user locally
      await _localDataSource.saveTokens(
        access: response.accessToken, 
        refresh: response.refreshToken,
      );
      await _localDataSource.saveUser(response.user);
      
      // Save the email for next time
      await _localDataSource.saveLastEmail(username);
      
      return response.user;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String?> getLastEmail() async {
    return await _localDataSource.getLastEmail();
  }

  @override
  Future<void> saveLastEmail(String email) async {
    await _localDataSource.saveLastEmail(email);
  }
}
