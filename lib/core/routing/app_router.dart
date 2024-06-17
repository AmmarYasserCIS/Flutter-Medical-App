import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicalapp/core/di/dependency_injection.dart';
import 'package:medicalapp/core/routing/routes.dart';
import 'package:medicalapp/features/login/data/cubit/login_cubit.dart';
import 'package:medicalapp/features/login/ui/login_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/onboarding/onboarding_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) =>  BlocProvider(create: (context) =>
            getIt<LoginCubit>()
          , child: const LoginScreen()),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(body: Center(child: Text("Unknown route"))),
        );
    }
  }
}
