import '../entities/user.dart';

abstract class AuthRepository {
  Future<User> login(String username, String password);
  Future<String?> getLastEmail();
  Future<void> saveLastEmail(String email);
}
