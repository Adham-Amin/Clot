import 'package:clot/features/auth/data/models/requests/register_request.dart';
import 'package:clot/features/auth/domain/entities/user_entity.dart';
import 'package:clot/features/auth/domain/repos/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.authRepo}) : super(AuthInitial());

  final AuthRepo authRepo;

  Future<void> login({required String email, required String password}) async {
    emit(AuthLoading());
    final result = await authRepo.login(email: email, password: password);
    result.fold(
      (failure) => emit(AuthError(message: failure.message)),
      (user) => emit(AuthSuccess(user: user)),
    );
  }

  Future<void> register({required RegisterRequest registerRequest}) async {
    emit(AuthLoading());
    final result = await authRepo.register(registerRequest: registerRequest);
    result.fold(
      (failure) => emit(AuthError(message: failure.message)),
      (user) => emit(AuthSuccess(user: user)),
    );
  }
}
