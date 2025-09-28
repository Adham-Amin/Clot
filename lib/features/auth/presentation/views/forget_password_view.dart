import 'package:clot/core/di/service_locator.dart';
import 'package:clot/features/auth/domain/repos/auth_repo.dart';
import 'package:clot/features/auth/presentation/manager/forget_password_cubit/forget_password_cubit.dart';
import 'package:clot/features/auth/presentation/widgets/forget_password_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetPasswordCubit(authRepo: getIt<AuthRepo>()),
      child: const Scaffold(body: SafeArea(child: ForgetPasswordViewBody())),
    );
  }
}
