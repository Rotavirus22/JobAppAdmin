import 'package:flutter/material.dart';
import 'package:job_app_admin/common/constant/app_images.dart';
import 'package:job_app_admin/common/constant/ui_helpers.dart';
import 'package:job_app_admin/common/widgets/kButton.dart';
import 'package:job_app_admin/common/widgets/kTextFormfield.dart';
import 'package:job_app_admin/provider/home/features/addJobstate.dart';
import 'package:provider/provider.dart';

class AddJob extends StatelessWidget {
  const AddJob({super.key});

  @override
  Widget build(BuildContext context) {
    final addState = Provider.of<AddJobState>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 150,
              width: 150,
              child: Image.asset(logoImage),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    lVerticalSizedBox,
                    KTextFormField(
                      autoCorrect: true,
                      labelText: 'Job Title',
                      onChanged: addState.onTitleChanged,
                      obscureText: false,
                    ),
                    mVerticalSizedBox,
                    KTextFormField(
                      autoCorrect: true,
                      labelText: 'Company',
                      onChanged: addState.onCompanyChanged,
                      obscureText: false,
                    ),
                    mVerticalSizedBox,
                    KTextFormField(
                      autoCorrect: true,
                      labelText: 'Date',
                      onChanged: null,
                      obscureText: false,
                    ),
                    mVerticalSizedBox,
                    Row(
                      children: [
                        Expanded(
                          child: KTextFormField(
                            autoCorrect: true,
                            labelText: 'Salary',
                            onChanged: addState.onSalaryChanged,
                            obscureText: false,
                          ),
                        ),
                        mhorizentalSizedBox,
                        Expanded(
                          child: KTextFormField(
                            autoCorrect: true,
                            labelText: 'Location',
                            onChanged: addState.onLocationChanged,
                            obscureText: false,
                          ),
                        ),
                      ],
                    ),
                    mVerticalSizedBox,
                    KTextFormField(
                      autoCorrect: true,
                      labelText: 'Description',
                      onChanged: addState.onDescriptionChanged,
                      obscureText: false,
                      maxLine: null,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: KButton(
                onPressed: () {
                  addState.addJob();
                },
                child: addState.isLoading
                    ? CircularProgressIndicator()
                    : Text('Create'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
