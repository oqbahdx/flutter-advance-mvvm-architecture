import 'package:advanced/app/di.dart';
import 'package:advanced/presentation/forgot_password/view/forgot_password_view.dart';
import 'package:advanced/presentation/login/view/login_view.dart';
import 'package:advanced/presentation/main/view/main_view.dart';
import 'package:advanced/presentation/on_boarding/view/on_boarding_view.dart';
import 'package:advanced/presentation/register/view/register_view.dart';
import 'package:advanced/presentation/resources/strings_manager.dart';
import 'package:advanced/presentation/splash/view/splash_view.dart';
import 'package:advanced/presentation/store_details/view/store_details_view.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String splashRoute = "/";
  static const String onBoardingRoute = "/on_boarding";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgot_password";
  static const String mainRoute = "/main";
  static const String storeDetailsRoute = "/store_details";
}

class RoutesGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
      case Routes.loginRoute:
        initLoginModule();
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordView());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainView());
      case Routes.storeDetailsRoute:
        return MaterialPageRoute(builder: (_) => const StoreDetailsView());
      default:
        return unDefined();
    }
  }

  static Route<dynamic> unDefined() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(AppStrings.noRouteFound),
              ),
              body: const Center(
                child: Text(AppStrings.noRouteFound),
              ),
            ));
  }
}
