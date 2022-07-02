import 'package:advanced_flutter_arabic/app/di.dart';
import 'package:advanced_flutter_arabic/presentation/register/viewmodel/register_viewmodel.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
final  RegisterViewModel _viewModel = instance<RegisterViewModel>();
final TextEditingController _nameController = TextEditingController();
final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
final TextEditingController _mobileNumberController = TextEditingController();
final GlobalKey<FormState> _globalKey = GlobalKey();
bind(){
  _viewModel.start();
  _nameController.addListener(() {
    _viewModel.setUserName(_nameController.text);
  });
  _emailController.addListener(() {
    _viewModel.setEmail(_emailController.text);
  });
  _passwordController.addListener(() {
    _viewModel.setPassword(_passwordController.text);
  });
  _mobileNumberController.addListener(() {
    _viewModel.setMobileNumber(_mobileNumberController.text);
  });
}
@override
  void initState() {
    bind();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return contentWidget();
  }
  Widget contentWidget(){
  return Scaffold();
  }
@override
  void dispose() {
  _viewModel.dispose();
    super.dispose();
  }
}
