import 'package:clot/core/errors/failure.dart';
import 'package:clot/core/services/shared_preferences_service.dart';
import 'package:clot/features/auth/domain/entities/user_entity.dart';
import 'package:clot/features/profile/data/data_sources/profile_remote_data_source.dart';
import 'package:clot/features/profile/data/models/requests/address_request.dart';
import 'package:clot/features/profile/data/models/requests/change_password_request.dart';
import 'package:clot/features/profile/data/models/requests/update_me_request.dart';
import 'package:clot/features/profile/data/models/responses/address_response.dart';
import 'package:clot/features/profile/domain/repos/profile_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ProfileRepoImpl extends ProfileRepo {
  final ProfileRemoteDataSource profileRemoteDataSource;
  ProfileRepoImpl({required this.profileRemoteDataSource});

  @override
  Future<Either<Failure, List<AddressResponse>>> addAddress({
    required AddressRequest request,
  }) async {
    try {
      var data = await profileRemoteDataSource.addAddress(request: request);
      return Right(data);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, UserEntity>> changePassword({
    required ChangePasswordRequest request,
  }) async {
    try {
      var data = await profileRemoteDataSource.changePassword(request: request);
      Prefs.clearUserData();
      Prefs.clearToken();
      Prefs.setUser(data.toEntity());
      Prefs.setToken(data.token!);
      return Right(data.toEntity());
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<AddressResponse>>> deleteAddress({
    required String addressId,
  }) async {
    try {
      var data = await profileRemoteDataSource.deleteAddress(
        addressId: addressId,
      );
      return Right(data);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<AddressResponse>>> getAddress() async {
    try {
      var data = await profileRemoteDataSource.getAddress();
      return Right(data);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, UserEntity>> updateMe({
    required UpdateMeRequest request,
  }) async {
    try {
      var data = await profileRemoteDataSource.updateMe(request: request);
      Prefs.clearUserData();
      Prefs.setUser(data.toEntity());
      return Right(data.toEntity());
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
