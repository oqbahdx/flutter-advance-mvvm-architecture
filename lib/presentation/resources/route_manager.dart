import 'package:advanced/presentation/forgot_password/forgot_password_view.dart';
import 'package:advanced/presentation/main/main_view.dart';
import 'package:advanced/presentation/onBoarding/onBoarding.dart';
import 'package:advanced/presentation/resources/string_manager.dart';
import 'package:advanced/presentation/splash/splash_view.dart';
import 'package:advanced/presentation/store_details/store_details_view.dart';
import 'package:flutter/material.dart';

import '../login/login_view.dart';
import '../register/register_view.dart';

class Routes {
  static const String splashRoute = "/";
  static const String onBoardingRoute = "/onBoarding";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String mainRoute = "/main";
  static const String storeDetailsRoute = "/storeDetails";
}

class RouteGenerator {
  static Route<dynamic> getRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (context) => const SplashView());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (context) => const OnBoardingView());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (context) => const LoginView());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (context) => const RegisterView());
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(
            builder: (context) => const ForgotPasswordView());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (context) => const MainView());
      case Routes.storeDetailsRoute:
        return MaterialPageRoute(
            builder: (context) => const StoreDetailsView());
      default:
        return unDefinedRote();
    }
  }

  static Route<dynamic> unDefinedRote() {
    return MaterialPageRoute(
        builder: (context) => Scaffold(
              appBar: AppBar(
                title: const Text(AppString.unDefinedRout),
              ),
              body: const Center(
                child: Text(AppString.unDefinedRout),
              ),
            ));
  }
}
