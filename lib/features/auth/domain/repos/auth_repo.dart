import 'package:clot/core/errors/failure.dart';
import 'package:clot/features/auth/data/models/reponses/forget_password_response.dart';
import 'package:clot/features/auth/data/models/requests/register_request.dart';
import 'package:clot/features/auth/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> login({
    required String email,
    required String password,
  });
  Future<Either<Failure, UserEntity>> register({
    required RegisterRequest registerRequest,
  });

  Future<Either<Failure, ForgetPasswordResponse>> forgetPassword({
    required String email,
  });

  Future<Either<Failure, VerifyResetCodeResponse>> verifyResetCode({
    required String code,
  });

  Future<Either<Failure, ResetPasswordResponse>> resetPassword({
    required String email,
    required String newPassword,
  });
}
