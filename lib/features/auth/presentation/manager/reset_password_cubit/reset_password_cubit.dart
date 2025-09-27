import 'package:clot/features/auth/data/models/reponses/forget_password_response.dart';
import 'package:clot/features/auth/domain/repos/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit({required this.authRepo}) : super(ResetPasswordInitial());

  final AuthRepo authRepo;

  Future<void> resetPassword({
    required String email,
    required String newPassword,
  }) async {
    emit(ResetPasswordLoading());
    final result = await authRepo.resetPassword(
      email: email,
      newPassword: newPassword,
    );
    result.fold(
      (failure) => emit(ResetPasswordError(message: failure.message)),
      (success) => emit(ResetPasswordSuccess(resetPasswordResponse: success)),
    );
  }
}
