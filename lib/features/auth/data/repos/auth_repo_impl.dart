import 'package:clot/core/errors/failure.dart';
import 'package:clot/core/services/shared_preferences_service.dart';
import 'package:clot/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:clot/features/auth/data/models/reponses/forget_password_response.dart';
import 'package:clot/features/auth/data/models/requests/register_request.dart';
import 'package:clot/features/auth/domain/entities/user_entity.dart';
import 'package:clot/features/auth/domain/repos/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AuthRepoImpl extends AuthRepo {
  final AuthRemoteDataSource authRemoteDataSource;
  AuthRepoImpl({required this.authRemoteDataSource});

  @override
  Future<Either<Failure, ForgetPasswordResponse>> forgetPassword({
    required String email,
  }) async {
    try {
      var data = await authRemoteDataSource.forgetPassword(email: email);
      return Right(data);
    } catch (failure) {
      if (failure is DioException) {
        return Left(ServerFailure.fromDioException(failure));
      } else {
        return Left(ServerFailure(failure.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, UserEntity>> login({
    required String email,
    required String password,
  }) async {
    try {
      var data = await authRemoteDataSource.login(
        email: email,
        password: password,
      );
      await Prefs.setUser(data.toUserEntity());
      await Prefs.setToken(data.token!);
      return Right(data.toUserEntity());
    } catch (failure) {
      if (failure is DioException) {
        return Left(ServerFailure.fromDioException(failure));
      } else {
        return Left(ServerFailure(failure.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, UserEntity>> register({
    required RegisterRequest registerRequest,
  }) async {
    try {
      var data = await authRemoteDataSource.register(
        registerRequest: registerRequest,
      );
      await Prefs.setUser(data.toUserEntity());
      await Prefs.setToken(data.token!);
      return Right(data.toUserEntity());
    } catch (failure) {
      if (failure is DioException) {
        return Left(ServerFailure.fromDioException(failure));
      } else {
        return Left(ServerFailure(failure.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, ResetPasswordResponse>> resetPassword({
    required String email,
    required String newPassword,
  }) async {
    try {
      var data = await authRemoteDataSource.resetPassword(
        email: email,
        newPassword: newPassword,
      );
      return Right(data);
    } catch (failure) {
      if (failure is DioException) {
        return Left(ServerFailure.fromDioException(failure));
      } else {
        return Left(ServerFailure(failure.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, VerifyResetCodeResponse>> verifyResetCode({
    required String code,
  }) async {
    try {
      var data = await authRemoteDataSource.verifyResetCode(code: code);
      return Right(data);
    } catch (failure) {
      if (failure is DioException) {
        return Left(ServerFailure.fromDioException(failure));
      } else {
        return Left(ServerFailure(failure.toString()));
      }
    }
  }
}
