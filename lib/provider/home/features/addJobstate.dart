import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:job_app_admin/main.dart';
import 'package:job_app_admin/services/dio%20interceptors/dio_interceptors.dart';

class AddJobState extends ChangeNotifier {
  Dio dio = getDioInstance();

  String? jobTitle;
  String? company;
  String? location;
  DateTime? date;
  String? estimatedSalary;
  String? jobDescription;

  bool isLoading = false;

  onTitleChanged(value) {
    jobTitle = value;
    notifyListeners();
  }

  onCompanyChanged(value) {
    company = value;
    notifyListeners();
  }

  onLocationChanged(value) {
    location = value;
    notifyListeners();
  }

  onDateChanged(value) {
    date = value;
    notifyListeners();
  }

  onSalaryChanged(value) {
    estimatedSalary = value;
    notifyListeners();
  }

  onDescriptionChanged(value) {
    jobDescription = value;
    notifyListeners();
  }

  addJob() async {
    isLoading = true;
    notifyListeners();
    var data = {
      'jobTitle': jobTitle,
      'jobDescription': jobDescription,
      'company': company,
      'estimatedSalary': estimatedSalary,
      'location': location,
    };
    try {
      var response = await dio.post('/job/createJob', data: data);
      if (response.statusCode == 200) {
        navigatorKey.currentState!.pushReplacementNamed('/dashboard');
      }
    } on DioException catch (e) {
      print(e);
      print('Response Data: ${e.response?.data}');
    }
    isLoading = false;
    notifyListeners();
  }
}
