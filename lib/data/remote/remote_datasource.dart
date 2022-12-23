import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wcs_mobil/data/remote/remote_data_repository.dart';
import 'package:wcs_mobil/data/remote/rest_api_client.dart';
import 'package:wcs_mobil/domain/repositories/data_repository.dart';

Dio _dio = Dio(
  BaseOptions(
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    connectTimeout: 10000,
    receiveTimeout: 10000,
    sendTimeout: 10000,
  ),
)..interceptors.add(
    AwesomeDioInterceptor(
      logRequestTimeout: false,
      logRequestHeaders: true,
      logResponseHeaders: true,
      logger: debugPrint,
    ),
  );

mixin RemoteDatasource {
  static Override create(String apiUrl) =>
      DataRepository.provider.overrideWithValue(
          RemoteDataRepository(RestApiClient(_dio, baseUrl: apiUrl)));
}
