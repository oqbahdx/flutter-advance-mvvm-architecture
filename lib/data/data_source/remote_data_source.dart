import 'package:advanced/data/network/app_api.dart';
import 'package:advanced/data/network/requests.dart';
import 'package:advanced/data/response/response.dart';

abstract class RemoteDataSource {
  Future<AuthenticationResponse> login(LoginRequest loginRequest);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final AppServicesClient _appServicesClient;

  RemoteDataSourceImpl(this._appServicesClient);

  @override
  Future<AuthenticationResponse> login(LoginRequest loginRequest) async {
    return await _appServicesClient.login(
        loginRequest.email, loginRequest.password);
  }
}
