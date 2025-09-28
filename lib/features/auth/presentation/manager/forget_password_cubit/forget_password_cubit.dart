import 'package:clot/features/auth/data/models/reponses/forget_password_response.dart';
import 'package:clot/features/auth/domain/repos/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit({required this.authRepo})
    : super(ForgetPasswordInitial());

  final AuthRepo authRepo;

  Future<void> forgetPassword({required String email}) async {
    emit(ForgetPasswordLoading());
    final result = await authRepo.forgetPassword(email: email);
    result.fold(
      (failure) => emit(ForgetPasswordError(message: failure.message)),
      (success) => emit(ForgetPasswordSuccess(message: success)),
    );
  }

  Future<void> verifyCode({required String code}) async {
    emit(ForgetPasswordLoading());
    final result = await authRepo.verifyResetCode(code: code);
    result.fold(
      (failure) => emit(ForgetPasswordError(message: failure.message)),
      (success) => emit(VerifyCodeSuccess(message: success)),
    );
  }

  Future<void> resetPassword({
    required String email,
    required String newPassword,
  }) async {
    emit(ForgetPasswordLoading());
    final result = await authRepo.resetPassword(
      email: email,
      newPassword: newPassword,
    );
    result.fold(
      (failure) => emit(ForgetPasswordError(message: failure.message)),
      (success) => emit(ResetPasswordSuccess(message: success)),
    );
  }
}
