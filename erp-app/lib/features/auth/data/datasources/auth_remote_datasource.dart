import 'package:erp_app/core/network/dio_client.dart';
import 'package:erp_app/core/network/api_endpoints.dart';
import 'package:erp_app/features/auth/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<LoginResponseModel> login(LoginRequestModel request);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final DioClient _client;

  AuthRemoteDataSourceImpl(this._client);

  @override
  Future<LoginResponseModel> login(LoginRequestModel request) async {
    final response = await _client.post(
      ApiEndpoint.login,
      data: request.toJson(),
    );

    final data = response.data;
    if (data['status'] == 'success') {
      return LoginResponseModel.fromJson(data['data']);
    } else {
      // Throwing the message from the API so it can be shown in UI
      throw data['message'] ?? 'Login failed';
    }
  }
}
