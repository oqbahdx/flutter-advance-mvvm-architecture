import 'package:advanced/app/di.dart';
import 'package:advanced/domain/usecase/login_usecase.dart';
import 'package:advanced/presentation/login/viewmodel/login_viewmodel.dart';
import 'package:advanced/presentation/resources/assets_manager.dart';
import 'package:advanced/presentation/resources/color_manager.dart';
import 'package:advanced/presentation/resources/strings_manager.dart';
import 'package:advanced/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

import '../../resources/routes_manager.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginViewModel _viewModel = instance<LoginViewModel>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey();

  _bind() {
    _viewModel.start();
    _userNameController
        .addListener(() => _viewModel.setUserName(_userNameController.text));
    _passwordController.addListener(
        () => _viewModel.setPassword(_passwordController.text));
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return getContentWidget();
  }

  Widget getContentWidget() {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: SingleChildScrollView(
        key: _key,
        child: Form(
          child: Column(
            children: [
              const SizedBox(
                height: AppSize.s100,
              ),
              Image.asset(ImageAssets.splashLogo),
              const SizedBox(
                height: AppSize.s22,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
                child: StreamBuilder<bool>(
                    stream: _viewModel.outIsUserNameValid,
                    builder: (context, snapshot) {
                      return TextFormField(
                        keyboardType: TextInputType.name,
                        controller: _userNameController,
                        decoration: InputDecoration(
                          hintText: AppStrings.userName,
                          labelText: AppStrings.userName,
                          errorText: snapshot.data ?? true
                              ? null
                              : AppStrings.userNameError,
                        ),
                      );
                    }),
              ),
              const SizedBox(
                height: AppSize.s22,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
                child: StreamBuilder<bool>(
                    stream: _viewModel.outIsPasswordValid,
                    builder: (context, snapshot) {
                      return TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        controller: _passwordController,
                        decoration: InputDecoration(
                          hintText: AppStrings.password,
                          labelText: AppStrings.password,
                          errorText: snapshot.data ?? true
                              ? null
                              : AppStrings.passwordError,
                        ),
                      );
                    }),
              ),
              const SizedBox(
                height: AppSize.s40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
                child: StreamBuilder<bool>(
                    stream: _viewModel.outAreAllInputsValid,
                    builder: (context, snapshot) {
                      return SizedBox(
                        width: double.infinity,
                        height: AppSize.s40,
                        child: ElevatedButton(
                            onPressed: (snapshot.data ?? false)
                                ? () {
                                    _viewModel.login();
                                  }
                                : null,
                            child: const Text(AppStrings.login)),
                      );
                    }),
              ),
              const SizedBox(
                height: AppSize.s22,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, Routes.forgotPasswordRoute);
                    },
                    child: Text(
                      AppStrings.forgotPassword,
                      style: Theme.of(context).textTheme.titleMedium,
                      textAlign: TextAlign.end,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, Routes.registerRoute);
                    },
                    child: Text(
                      AppStrings.registerText,
                      style: Theme.of(context).textTheme.titleMedium,
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
