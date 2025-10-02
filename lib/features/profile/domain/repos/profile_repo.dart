import 'package:clot/core/errors/failure.dart';
import 'package:clot/features/auth/domain/entities/user_entity.dart';
import 'package:clot/features/profile/data/models/requests/address_request.dart';
import 'package:clot/features/profile/data/models/requests/change_password_request.dart';
import 'package:clot/features/profile/data/models/requests/update_me_request.dart';
import 'package:clot/features/profile/data/models/responses/address_response.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepo {
  Future<Either<Failure, UserEntity>> updateMe({
    required UpdateMeRequest request,
  });
  Future<Either<Failure, UserEntity>> changePassword({
    required ChangePasswordRequest request,
  });
  Future<Either<Failure, List<AddressResponse>>> getAddress();
  Future<Either<Failure, List<AddressResponse>>> addAddress({
    required AddressRequest request,
  });
  Future<Either<Failure, List<AddressResponse>>> deleteAddress({
    required String addressId,
  });
}
