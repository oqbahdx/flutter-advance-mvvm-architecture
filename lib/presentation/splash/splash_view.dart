import 'dart:async';

import 'package:advanced/presentation/resources/assets_manager.dart';
import 'package:advanced/presentation/resources/color_manager.dart';
import 'package:advanced/presentation/resources/route_manager.dart';
import 'package:flutter/material.dart';

import '../resources/constants.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;

  _delay() {
    _timer = Timer(const Duration(seconds: AppConstants.splashDelay), _goNext);
  }

  _goNext() {
    Navigator.of(context).pushReplacementNamed(Routes.onBoardingRoute);
  }

  @override
  void initState() {
    super.initState();
    _delay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Center(
        child: Image.asset(ImageAssets.splashLogo),
      ),
    );
  }
}
