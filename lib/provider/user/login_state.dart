import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:job_app_admin/main.dart';
import 'package:job_app_admin/services/dio%20interceptors/dio_interceptors.dart';
import 'package:job_app_admin/services/local%20Storage/local_storage.dart';

class LoginState extends ChangeNotifier {
  Dio dio = getDioInstance();
  String? email;
  String? password;
  bool isLoading = false;

  onEmailChanged(value) {
    email = value;
    notifyListeners();
  }

  onPasswordChanged(value) {
    password = value;
    notifyListeners();
  }

  login() async {
    isLoading = true;
    notifyListeners();
    var data = {'email': email, 'password': password};
    try {
      var response = await dio.post('/users/login', data: data);
      localStorage.write('token', response.data["accessToken"]);
      var accessTkn = localStorage.read('token');
      print(accessTkn);
      navigatorKey.currentState!.pushReplacementNamed('/dashboard');
    } on DioException catch (e) {
      print(e);
      print('Response Data: ${e.response?.data}');
    }
    isLoading = false;
    notifyListeners();
  }
}
