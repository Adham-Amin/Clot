part of 'reset_password_cubit.dart';

sealed class ResetPasswordState {}

final class ResetPasswordInitial extends ResetPasswordState {}

final class ResetPasswordLoading extends ResetPasswordState {}

final class ResetPasswordSuccess extends ResetPasswordState {
  final ResetPasswordResponse resetPasswordResponse;
  ResetPasswordSuccess({required this.resetPasswordResponse});
}

final class ResetPasswordError extends ResetPasswordState {
  final String message;
  ResetPasswordError({required this.message});
}
