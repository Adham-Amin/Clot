import 'package:clot/core/functions/execute_to_navigator.dart';
import 'package:clot/core/routes/on_generate_route.dart';
import 'package:clot/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const Clot());
}

class Clot extends StatelessWidget {
  const Clot({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      splitScreenMode: true,
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: AppColors.primary,
            brightness: Brightness.dark,
          ),
          textTheme: GoogleFonts.plusJakartaSansTextTheme(),
          primaryColor: AppColors.primary,
          scaffoldBackgroundColor: AppColors.dark,
        ),
        initialRoute: executeToNavigator(),
        onGenerateRoute: onGenerateRoute,
      ),
    );
  }
}
