import 'package:dio/dio.dart';
import 'package:job_app_admin/services/local%20Storage/local_storage.dart';

Dio getDioInstance() {
  Dio dio = Dio(
    BaseOptions(baseUrl: "http://192.168.1.71:8000/api/"),
  );
  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) {
      final token = localStorage.read('token');
      if (token != null) {
        options.headers['Authorization'] = 'Bearer $token';
      }
      return handler.next(options);
    },
    onResponse: (response, handler) {
      return handler.next(response);
    },
    onError: (error, handler) {
      return handler.next(error);
    },
  ));
  return dio;
}
