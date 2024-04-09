import 'package:flutter/material.dart';
import 'package:job_app_admin/common/constant/ui_helpers.dart';
import 'package:job_app_admin/common/widgets/kButton.dart';
import 'package:job_app_admin/common/widgets/kTextFormfield.dart';
import 'package:job_app_admin/main.dart';
import 'package:job_app_admin/provider/user/register_state.dart';
import 'package:job_app_admin/screens/validations/user_validation.dart';
import 'package:job_app_admin/themes/app_themes.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final registerState = Provider.of<RegisterState>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: _formKey,
            child: SizedBox(
              height: 800,
              width: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  KTextFormField(
                    onChanged: registerState.onFullNameChanged,
                    autoCorrect: false,
                    labelText: 'FullName',
                    obscureText: false,
                    prefixIcon: const Icon(Icons.person_2_outlined),
                    validator: UserValidation().nameValidator,
                  ),
                  mVerticalSizedBox,
                  mVerticalSizedBox,
                  KTextFormField(
                    onChanged: registerState.onEmailChanged,
                    autoCorrect: false,
                    labelText: 'Email',
                    obscureText: false,
                    prefixIcon: const Icon(Icons.email_outlined),
                    textInputType: TextInputType.emailAddress,
                    validator: UserValidation().emailValidator,
                  ),
                  mVerticalSizedBox,
                  mVerticalSizedBox,
                  KTextFormField(
                    onChanged: registerState.onPasswordChanged,
                    autoCorrect: false,
                    labelText: 'Password',
                    obscureText: true,
                    prefixIcon: const Icon(Icons.lock_outline_rounded),
                    validator: UserValidation().passwordValidator,
                  ),
                  mVerticalSizedBox,
                  mVerticalSizedBox,
                  KTextFormField(
                    onChanged: registerState.onConfirmChanged,
                    autoCorrect: false,
                    labelText: 'Confirm Password',
                    obscureText: true,
                    prefixIcon: const Icon(Icons.lock_outline_rounded),
                    validator: UserValidation().passwordValidator,
                  ),
                  mVerticalSizedBox,
                  mVerticalSizedBox,
                  KButton(
                    onPressed: () {
                      registerState.register();
                    },
                    child: registerState.isLoading
                        ? CircularProgressIndicator()
                        : Text('Register'),
                  ),
                  xlVerticalSizedBox,
                  Row(
                    children: [
                      Text("Already have an account?"),
                      SizedBox(width: 5),
                      InkWell(
                        onTap: () {
                          navigatorKey.currentState!
                              .pushReplacementNamed('/loginScreen');
                        },
                        child: Text(
                          "Signin here!",
                          style: TextStyle(
                              color: appPrimaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
