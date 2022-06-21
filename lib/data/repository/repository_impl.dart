import 'package:advanced/data/data_source/remote_data_source.dart';
import 'package:advanced/data/mapper/mapper.dart';
import 'package:advanced/data/network/error_handler.dart';
import 'package:advanced/data/network/failure.dart';
import 'package:advanced/data/network/network_info.dart';
import 'package:advanced/data/network/requests.dart';
import 'package:advanced/domain/models/models.dart';
import 'package:advanced/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  RepositoryImpl(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, Authentication>> login(
      LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      // its connected its save to call api
      try {
        final response = await _remoteDataSource.login(loginRequest);
        if (response.status == ApiInternalError.success) {
          return Right(response.toDomain());
        } else {
          // business error
          return Left(Failure(ApiInternalError.failure,
              response.message ?? ResponseMessage.theDefault));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      // no inter net connection
      return Left(Failure(ResponseCode.noInternetConnection,
          ResponseMessage.noInternetConnection));
    }
  }
}
