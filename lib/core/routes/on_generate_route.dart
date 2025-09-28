import 'package:clot/core/routes/app_routes.dart';
import 'package:clot/features/auth/presentation/views/login_view.dart';
import 'package:clot/features/auth/presentation/views/register_view.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.loginView:
      return MaterialPageRoute(builder: (_) => const LoginView());
    case AppRoutes.registerView:
      return MaterialPageRoute(builder: (_) => const RegisterView());
    default:
      return MaterialPageRoute(builder: (_) => const Scaffold());
  }
}
