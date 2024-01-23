import 'dart:io';
import 'api_host.dart';
import 'endpoint.dart';
import 'package:dio/dio.dart';

typedef Failure = void Function(DioException error);
typedef Success = void Function(dynamic result);

class ApiProvider {
  final Dio _dio = Dio();

  Future<void> request(
      {required Endpoint endpoint, Success? success, Failure? failure}) async {
    _dio.options.method = endpoint.method.name;
    _dio.options.headers = ApiHost.sessionHeaders;
    _dio.options.queryParameters = endpoint.queryParameters ?? {};
    _dio.options.baseUrl = ApiHost.baseURL;
    _dio.options.contentType = endpoint.contentType ?? ContentType.json.value;

    await _dio.request(endpoint.path, data: endpoint.data).then((response) {
      success?.call(response.data);
    }).onError<DioException>((error, stackTrace) {
      failure?.call(error);
    });
  }
}
