import 'package:advanced/app/app_prefs.dart';
import 'package:advanced/app/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String APPLICATION_JSON = "application/json";
const String CONTENT_TYPE = "content-type";
const String AUTHORIZATION = "authorization";
const String ACCEPT = "accept";
const String DEFAULT_LANGUAGE = "language";

class DioFactory {
  AppPreference _appPreference;
  DioFactory(this._appPreference);
  Future<Dio> getDio() async {
    Dio dio = Dio();
    String language = await _appPreference.getLanguage();
    Map<String, String> headers = ({
      CONTENT_TYPE: APPLICATION_JSON,
      ACCEPT: APPLICATION_JSON,
      AUTHORIZATION: "SEND TOKEN HERE",
      DEFAULT_LANGUAGE: language,
    });
    dio.options = BaseOptions(
        baseUrl: Constants.baseUrl,
        headers: headers,
        receiveTimeout: Constants.apiTimeOut,
        sendTimeout: Constants.apiTimeOut);
    if (kDebugMode) {
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ));
    }
    return dio;
  }
}
