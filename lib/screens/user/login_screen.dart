import 'package:flutter/material.dart';
import 'package:job_app_admin/common/constant/app_images.dart';
import 'package:job_app_admin/common/constant/ui_helpers.dart';
import 'package:job_app_admin/common/widgets/kButton.dart';
import 'package:job_app_admin/common/widgets/kTextFormfield.dart';
import 'package:job_app_admin/main.dart';
import 'package:job_app_admin/provider/user/login_state.dart';
import 'package:job_app_admin/screens/validations/user_validation.dart';
import 'package:job_app_admin/themes/app_themes.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginState = Provider.of<LoginState>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  xlVerticalSizedBox,
                  xlVerticalSizedBox,
                  Container(
                    height: 200,
                    width: 200,
                    child: Image.asset(logoImage),
                  ),
                  mVerticalSizedBox,
                  KTextFormField(
                    onChanged: loginState.onEmailChanged,
                    obscureText: false,
                    autoCorrect: false,
                    labelText: 'Email',
                    validator: UserValidation().emailValidator,
                    textInputType: TextInputType.emailAddress,
                    prefixIcon: const Icon(Icons.email_outlined),
                  ),
                  mVerticalSizedBox,
                  mVerticalSizedBox,
                  KTextFormField(
                    onChanged: loginState.onPasswordChanged,
                    autoCorrect: false,
                    labelText: 'Password',
                    validator: UserValidation().passwordValidator,
                    prefixIcon: const Icon(Icons.lock_outline_rounded),
                  ),
                  mVerticalSizedBox,
                  mVerticalSizedBox,
                  KButton(
                    onPressed: () {
                      loginState.login();
                    },
                    child: loginState.isLoading
                        ? CircularProgressIndicator()
                        : Text('Login'),
                  ),
                  xlVerticalSizedBox,
                  Row(
                    children: [
                      Text("Don't have an account?"),
                      SizedBox(width: 5),
                      InkWell(
                        onTap: () {
                          navigatorKey.currentState!
                              .pushReplacementNamed('/registerScreen');
                        },
                        child: Text(
                          "Signup here!",
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
