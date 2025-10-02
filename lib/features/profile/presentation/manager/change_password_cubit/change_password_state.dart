part of 'change_password_cubit.dart';

sealed class ChangePasswordState extends Equatable {
  const ChangePasswordState();

  @override
  List<Object> get props => [];
}

final class ChangePasswordInitial extends ChangePasswordState {}

final class ChangePasswordLoading extends ChangePasswordState {}

final class ChangePasswordLoaded extends ChangePasswordState {
  final UserEntity user;
  const ChangePasswordLoaded({required this.user});
}

final class ChangePasswordError extends ChangePasswordState {
  final String message;
  const ChangePasswordError({required this.message});
}
