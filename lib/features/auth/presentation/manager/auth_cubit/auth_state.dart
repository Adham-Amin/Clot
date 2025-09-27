part of 'auth_cubit.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {
  final UserEntity user;
  AuthSuccess({required this.user});
}

final class AuthError extends AuthState {
  final String message;
  AuthError({required this.message});
}
