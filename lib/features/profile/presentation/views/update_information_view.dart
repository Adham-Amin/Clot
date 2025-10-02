import 'package:clot/core/di/service_locator.dart';
import 'package:clot/features/profile/domain/repos/profile_repo.dart';
import 'package:clot/features/profile/presentation/manager/update_me_cubit/update_me_cubit.dart';
import 'package:clot/features/profile/presentation/widgets/update_information_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateInformationView extends StatelessWidget {
  const UpdateInformationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateMeCubit(profileRepo: getIt<ProfileRepo>()),
      child: const Scaffold(body: SafeArea(child: UpdateInformationViewBody())),
    );
  }
}
