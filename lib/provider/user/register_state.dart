import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:job_app_admin/services/dio%20interceptors/dio_interceptors.dart';
import 'package:job_app_admin/services/local%20Storage/local_storage.dart';

class RegisterState extends ChangeNotifier {
  Dio dio = getDioInstance();
  String? fullName;
  String? email;
  String? password;
  String? confirmPassword;
  bool isLoading = false;

  onFullNameChanged(value) {
    fullName = value;
    notifyListeners();
  }

  onEmailChanged(value) {
    email = value;
    notifyListeners();
  }

  onPasswordChanged(value) {
    password = value;
    notifyListeners();
  }

  onConfirmChanged(value) {
    confirmPassword = value;
    notifyListeners();
  }

  register() async {
    isLoading = true;
    notifyListeners();
    var data = {
      'fullName': fullName,
      'email': email,
      'password': password,
      'confirm_password': confirmPassword,
    };
    try {
      var response = await dio.post('/users/register', data: data);
      localStorage.write('token', response.data['accessToken']);
      var accessTkn = localStorage.read('token');
      print(accessTkn);
    } on DioException catch (e) {
      print(e);
    }
    isLoading = false;
    notifyListeners();
  }
}
