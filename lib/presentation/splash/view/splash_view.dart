import 'dart:async';

import 'package:advanced/presentation/resources/assets_manager.dart';
import 'package:advanced/presentation/resources/color_manager.dart';
import 'package:advanced/presentation/resources/routes_manager.dart';
import 'package:advanced/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../resources/constraints_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _delay();
  }
  Timer? _timer;

  _delay(){
    _timer = Timer(const Duration(seconds: AppConstants.splashDelay), () {
      _goNext();
    });
  }
  _goNext(){
    Navigator.of(context).pushReplacementNamed(Routes.onBoardingRoute);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: ColorManager.primary
        ),
        backgroundColor: ColorManager.primary,elevation: AppSize.s0,),
      body: Center(
        child: Image.asset(ImageAssets.splashLogo),
      ),
    );
  }
}
