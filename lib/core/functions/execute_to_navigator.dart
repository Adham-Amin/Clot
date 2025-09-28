import 'package:clot/core/routes/app_routes.dart';
import 'package:clot/core/services/shared_preferences_service.dart';

String executeToNavigator() {
  final user = Prefs.getUser();
  return user != null ? AppRoutes.mainView : AppRoutes.loginView;
}
