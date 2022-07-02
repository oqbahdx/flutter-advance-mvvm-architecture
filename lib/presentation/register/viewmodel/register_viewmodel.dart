import 'dart:async';
import 'dart:io';

import 'package:advanced_flutter_arabic/domain/usecase/register_usecase.dart';
import 'package:advanced_flutter_arabic/presentation/resources/strings_manager.dart';

import '../../../app/functions.dart';
import '../../base/baseviewmodel.dart';
import '../../common/freezed_data_classes.dart';
import '../../common/state_renderer/state_renderer.dart';
import '../../common/state_renderer/state_renderer_impl.dart';

class RegisterViewModel extends BaseViewModel
    with RegisterViewModelInputs, RegisterViewModelOutputs {
  final StreamController _userNameStreamController =
      StreamController<String>.broadcast();
  final StreamController _emailStreamController =
      StreamController<String>.broadcast();
  final StreamController _passwordNameStreamController =
      StreamController<String>.broadcast();
  final StreamController _profilePictureCodeStreamController =
      StreamController<File>.broadcast();
  final StreamController _mobileNumberStreamController =
      StreamController<String>.broadcast();
  final StreamController _allInputsAreValidStreamController =
      StreamController<String>.broadcast();
  final RegisterUseCase _registerUseCase;

  RegisterViewModel(this._registerUseCase);

  var registerObject = RegisterObject("", "", "", "", "", "");

  @override
  void start() {
    inputState.add(ContentState());
  }

  @override
  void dispose() {
    _allInputsAreValidStreamController.close();
    _emailStreamController.close();
    _mobileNumberStreamController.close();
    _profilePictureCodeStreamController.close();
    _userNameStreamController.close();
    _passwordNameStreamController.close();
    super.dispose();
  }

  // inputs
  @override
  Sink get inputAllAreValid => _allInputsAreValidStreamController.sink;

  @override
  Sink get inputEmail => _emailStreamController.sink;

  @override
  Sink get inputMobileNumber => _mobileNumberStreamController.sink;

  @override
  Sink get inputPassword => _passwordNameStreamController.sink;

  @override
  Sink get inputProfilePicture => _profilePictureCodeStreamController.sink;

  @override
  Sink get inputUserName => _userNameStreamController.sink;

  // outputs
  @override
  Stream<bool> get outputIsUserNameValid => _userNameStreamController.stream
      .map((userName) => _isUserNameValid(userName));

  @override
  Stream<String?> get outputErrorUserName => _userNameStreamController.stream
      .map((userName) => userName ? null : AppStrings.userNameErrorInvalid);

  @override
  Stream<bool> get outputIsEmailValid =>
      _emailStreamController.stream.map((email) => isEmailValid(email));

  @override
  Stream<String?> get outputErrorEmail => _emailStreamController.stream
      .map((email) => email ? null : AppStrings.emailInvalid);

  @override
  Stream<bool> get outputIsMobileNumberValid =>
      _mobileNumberStreamController.stream
          .map((mobileNumber) => _isMobileNumberValid(mobileNumber));

  @override
  Stream<String?> get outputErrorMobileNumber =>
      _mobileNumberStreamController.stream.map((mobileNumber) =>
          mobileNumber ? null : AppStrings.mobileNumberInvalid);

  @override
  Stream<bool> get outputIsPasswordValid => _passwordNameStreamController.stream
      .map((password) => _isPasswordValid(password));

  @override
  Stream<String?> get outputErrorPassword =>
      _passwordNameStreamController.stream
          .map((password) => password ? null : AppStrings.passwordInvalid);

  @override
  Stream<File> get outputIsProfilePictureValid =>
      _profilePictureCodeStreamController.stream.map((file) => file);

  @override
  // TODO: implement outputAllAreValid
  Stream<bool> get outputAllAreValid => throw UnimplementedError();

  // functions
  bool _isUserNameValid(String userName) {
    return userName.isNotEmpty && userName.length > 7;
  }

  bool _isMobileNumberValid(String mobileNumber) {
    return mobileNumber.isNotEmpty && mobileNumber.length > 9;
  }

  bool _isPasswordValid(String password) {
    return password.isNotEmpty && password.length > 6;
  }

  @override
  setCountryCode(String countryCode) {
    if (countryCode.isNotEmpty) {
      registerObject = registerObject.copyWith(countryMobileCode: countryCode);
    } else {
      registerObject = registerObject.copyWith(countryMobileCode: "");
    }
  }

  @override
  setEmail(String email) {
    if (isEmailValid(email)) {
      registerObject = registerObject.copyWith(email: email);
    } else {
      registerObject = registerObject.copyWith(email: "");
    }
  }

  @override
  setMobileNumber(String mobileNumber) {
    if (_isMobileNumberValid(mobileNumber)) {
      registerObject = registerObject.copyWith(mobileNumber: mobileNumber);
    } else {
      registerObject = registerObject.copyWith(mobileNumber: "");
    }
  }

  @override
  setPassword(String password) {
    if (_isPasswordValid(password)) {
      registerObject = registerObject.copyWith(password: password);
    } else {
      registerObject = registerObject.copyWith(password: "");
    }
  }

  @override
  setProfilePicture(File profilePicture) {
    if (profilePicture.path.isNotEmpty) {
      registerObject =
          registerObject.copyWith(profilePicture: profilePicture.path);
    } else {
      registerObject = registerObject.copyWith(profilePicture: "");
    }
  }

  @override
  setUserName(String userName) {
    if (_isUserNameValid(userName)) {
      registerObject = registerObject.copyWith(userName: userName);
    } else {
      registerObject = registerObject.copyWith(userName: "");
    }
  }

  @override
  register() async {
    inputState.add(
        LoadingState(stateRendererType: StateRendererType.popupLoadingState));
    (await _registerUseCase.execute(RegisterUseCaseInput(
            registerObject.userName,
            registerObject.password,
            registerObject.email,
            registerObject.countryMobileCode,
            registerObject.mobileNumber,
            registerObject.profilePicture)))
        .fold(
            (failure) => {
                  // left -> failure
                  inputState.add(ErrorState(
                      StateRendererType.popupErrorState, failure.message))
                }, (data) {
      // right -> data (success)
      // content
      inputState.add(ContentState());
      // navigate to main screen
      // isUserLoggedInSuccessfullyStreamController.add(true);
    });
  }
}

abstract class RegisterViewModelInputs {
  Sink get inputUserName;

  Sink get inputEmail;

  Sink get inputPassword;

  Sink get inputMobileNumber;

  Sink get inputProfilePicture;

  Sink get inputAllAreValid;

  setUserName(String userName);

  setPassword(String password);

  setEmail(String email);

  setMobileNumber(String mobileNumber);

  setCountryCode(String countryCode);

  setProfilePicture(File profilePicture);

  register();
}

abstract class RegisterViewModelOutputs {
  Stream<bool> get outputIsUserNameValid;

  Stream<String?> get outputErrorUserName;

  Stream<bool> get outputIsEmailValid;

  Stream<String?> get outputErrorEmail;

  Stream<bool> get outputIsPasswordValid;

  Stream<String?> get outputErrorPassword;

  Stream<bool> get outputIsMobileNumberValid;

  Stream<String?> get outputErrorMobileNumber;

  Stream<File> get outputIsProfilePictureValid;

  Stream<bool> get outputAllAreValid;
}
