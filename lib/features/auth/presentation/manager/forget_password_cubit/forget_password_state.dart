part of 'forget_password_cubit.dart';

sealed class ForgetPasswordState {}

final class ForgetPasswordInitial extends ForgetPasswordState {}

final class ForgetPasswordLoading extends ForgetPasswordState {}

final class ForgetPasswordSuccess extends ForgetPasswordState {
  final ForgetPasswordResponse message;
  ForgetPasswordSuccess({required this.message});
}

final class VerifyCodeSuccess extends ForgetPasswordState {
  final VerifyResetCodeResponse message;
  VerifyCodeSuccess({required this.message});
}

final class ResetPasswordSuccess extends ForgetPasswordState {
  final ResetPasswordResponse message;
  ResetPasswordSuccess({required this.message});
}

final class ForgetPasswordError extends ForgetPasswordState {
  final String message;
  ForgetPasswordError({required this.message});
}
