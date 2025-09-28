import 'package:clot/core/services/api_service.dart';
import 'package:clot/features/auth/data/models/reponses/auth_response/auth_response.dart';
import 'package:clot/features/auth/data/models/reponses/forget_password_response.dart';
import 'package:clot/features/auth/data/models/requests/register_request.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResponse> login({required String email, required String password});
  Future<AuthResponse> register({required RegisterRequest registerRequest});

  Future<ForgetPasswordResponse> forgetPassword({required String email});

  Future<VerifyResetCodeResponse> verifyResetCode({required String code});

  Future<ResetPasswordResponse> resetPassword({
    required String email,
    required String newPassword,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiService apiService;
  AuthRemoteDataSourceImpl({required this.apiService});

  @override
  Future<ForgetPasswordResponse> forgetPassword({required String email}) async {
    var response = await apiService.post(
      endPoint: '/auth/forgotPasswords',
      data: {'email': email},
    );
    return ForgetPasswordResponse.fromJson(response);
  }

  @override
  Future<AuthResponse> login({
    required String email,
    required String password,
  }) async {
    var response = await apiService.post(
      endPoint: '/auth/signin',
      data: {'email': email, 'password': password},
    );
    return AuthResponse.fromJson(response);
  }

  @override
  Future<AuthResponse> register({
    required RegisterRequest registerRequest,
  }) async {
    var response = await apiService.post(
      endPoint: '/auth/signup',
      data: registerRequest.toJson(),
    );
    return AuthResponse.fromJson(response);
  }

  @override
  Future<ResetPasswordResponse> resetPassword({
    required String email,
    required String newPassword,
  }) async {
    var response = await apiService.put(
      endPoint: '/auth/resetPassword',
      data: {'email': email, 'newPassword': newPassword},
    );
    return ResetPasswordResponse.fromJson(response);
  }

  @override
  Future<VerifyResetCodeResponse> verifyResetCode({
    required String code,
  }) async {
    var response = await apiService.post(
      endPoint: '/auth/verifyResetCode',
      data: {'resetCode': code},
    );
    return VerifyResetCodeResponse.fromJson(response);
  }
}
