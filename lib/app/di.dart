import 'package:advanced/app/app_prefs.dart';
import 'package:advanced/data/data_source/remote_data_source.dart';
import 'package:advanced/data/network/app_api.dart';
import 'package:advanced/data/network/dio_factory.dart';
import 'package:advanced/data/network/network_info.dart';
import 'package:advanced/data/repository/repository_impl.dart';
import 'package:advanced/domain/repository/repository.dart';
import 'package:advanced/domain/usecase/login_usaecase.dart';
import 'package:advanced/presentation/login/viewmodel/login_viewmodel.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  // shared pref
  final sharedPref = await SharedPreferences.getInstance();
  instance.registerLazySingleton<SharedPreferences>(() => sharedPref);

  // app pref
  instance
      .registerLazySingleton<AppPreference>(() => AppPreference(instance()));

  // network info
  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));

  // dio factory
  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));

  // app services
  Dio dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  // remote data source

  instance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(instance<AppServiceClient>()));

  // repository

  instance.registerLazySingleton<Repository>(
      () => RepositoryImpl(instance(), instance()));
}

 initLoginModule()  {
   if(!GetIt.I.isRegistered<LoginUseCase>()){
     instance.registerFactory<LoginUseCase>(() =>LoginUseCase(instance()));
     instance.registerFactory<LoginViewModel>(() =>LoginViewModel(instance()));
   }

}
