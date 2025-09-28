import 'package:clot/core/di/service_locator.dart';
import 'package:clot/features/auth/domain/repos/auth_repo.dart';
import 'package:clot/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:clot/features/auth/presentation/widgets/register_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(authRepo: getIt<AuthRepo>()),
      child: const Scaffold(body: SafeArea(child: RegisterViewBody())),
    );
  }
}
