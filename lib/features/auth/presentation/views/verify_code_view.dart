import 'package:clot/features/auth/presentation/widgets/verify_code_view_body.dart';
import 'package:flutter/material.dart';

class VerifyCodeView extends StatelessWidget {
  const VerifyCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: VerifyCodeViewBody()));
  }
}
