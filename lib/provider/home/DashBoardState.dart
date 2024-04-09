import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:job_app_admin/model/dashBoardModel.dart';
import 'package:job_app_admin/model/jobModel.dart';
import 'package:job_app_admin/services/dio%20interceptors/dio_interceptors.dart';

class DashBoardState extends ChangeNotifier {
  DashBoardState() {
    _initializeDashboard();
  }

  Future<void> _initializeDashboard() async {
    try {
      await getDashboardinfo();
      await getRecentJob();
    } catch (e) {
      print(e);
    }
  }

  String? userId;

  JobModel? jobModel;
  DashBoardModel? dashBoardModel;
  Dio dio = getDioInstance();
  bool isLoading = false;

  getDashboardinfo() async {
    isLoading = true;
    notifyListeners();
    try {
      var response = await dio.get('/users/dashboard');
      dashBoardModel = DashBoardModel.fromJson(response.data);
      userId = dashBoardModel!.data!.sId;
      print(userId);
    } on DioException catch (e) {
      print(e);
    }
  }

  getRecentJob() async {
    isLoading = true;
    notifyListeners();
    try {
      var response = await dio.get('/job/user/$userId');
      jobModel = JobModel.fromJson(response.data);
      print(response.data);
    } on DioException catch (e) {
      print(e);
    }
    isLoading = false;
    notifyListeners();
  }
}
