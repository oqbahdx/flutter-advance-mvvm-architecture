import 'package:advanced/data/network/failure.dart';
import 'package:advanced/data/network/requests.dart';
import 'package:advanced/domain/models/models.dart';
import 'package:advanced/domain/repository/repository.dart';
import 'package:advanced/domain/usecase/usecase_base.dart';
import 'package:dartz/dartz.dart';

class LoginUseCase implements UseCaseBase<LoginUseCaseInput,Authentication> {
 final Repository _repository;
 LoginUseCase(this._repository);

  @override
  Future<Either<Failure, Authentication>> execute(LoginUseCaseInput input) async{
    return _repository.login(LoginRequest(input.email, input.password));
  }
}

class LoginUseCaseInput{
  String email;
  String password;
  LoginUseCaseInput(this.email,this.password);
}
