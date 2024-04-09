import 'package:flutter/material.dart';
import 'package:job_app_admin/common/constant/app_images.dart';
import 'package:job_app_admin/common/constant/ui_helpers.dart';
import 'package:job_app_admin/main.dart';
import 'package:job_app_admin/provider/home/DashBoardState.dart';
import 'package:job_app_admin/themes/app_themes.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dashboardState = Provider.of<DashBoardState>(context);
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: appPrimaryColor,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigatorKey.currentState!.pushNamed('/addJobScreen');
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            mVerticalSizedBox,
            mVerticalSizedBox,
            Column(
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.asset(logoImage),
                ),
                Text('Your Recent Job'),
                mVerticalSizedBox,
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: ListView.separated(
                    itemCount: dashboardState.jobModel?.data?.length ?? 0,
                    separatorBuilder: (context, index) => SizedBox(height: 5),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          print(index);
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Container(
                                  color: Colors.white,
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  height:
                                      MediaQuery.of(context).size.height * 0.5,
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Job Title: ${dashboardState.jobModel!.data![index].jobTitle}',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        sVerticalSizedBox,
                                        Text(
                                          'Company: ${dashboardState.jobModel!.data![index].company}',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        sVerticalSizedBox,
                                        Text(
                                          'Location: ${dashboardState.jobModel!.data![index].location}',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        Expanded(
                                          child: Align(
                                            alignment:
                                                FractionalOffset.bottomCenter,
                                            child: TextButton(
                                              onPressed: () {},
                                              child: Text(
                                                'View Job Applications',
                                                style: TextStyle(
                                                    color: Colors.blue),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                  12), // Adjust the radius as needed
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            height: MediaQuery.of(context).size.height * 0.18,
                            child: Column(
                              children: [
                                lVerticalSizedBox,
                                Row(
                                  children: [
                                    lhorizentalSizedBox,
                                    lhorizentalSizedBox,
                                    Text(
                                      dashboardState
                                          .jobModel!.data![index].jobTitle!,
                                      style: AppTheme()
                                          .lightTheme
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.topRight,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.yellow),
                                          child: Text('New'),
                                        ),
                                      ),
                                    ),
                                    mhorizentalSizedBox,
                                    mhorizentalSizedBox,
                                  ],
                                ),
                                sVerticalSizedBox,
                                Row(
                                  children: [
                                    lhorizentalSizedBox,
                                    lhorizentalSizedBox,
                                    Icon(Icons.newspaper_outlined),
                                    mhorizentalSizedBox,
                                    Text(
                                      dashboardState
                                          .jobModel!.data![index].company!,
                                      style: AppTheme()
                                          .lightTheme
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(color: Colors.black),
                                    ),
                                  ],
                                ),
                                sVerticalSizedBox,
                                Row(
                                  children: [
                                    lhorizentalSizedBox,
                                    lhorizentalSizedBox,
                                    Icon(Icons.location_city_outlined),
                                    mhorizentalSizedBox,
                                    Text(
                                      dashboardState
                                          .jobModel!.data![index].location!,
                                      style: AppTheme()
                                          .lightTheme
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(color: Colors.black),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
