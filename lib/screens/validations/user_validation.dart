class UserValidation {
  String? emailValidator(String? email) {
    if (email == null || email.isEmpty) {
      return "Email is required";
    }
    final RegExp emailRegExp = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
    if (!emailRegExp.hasMatch(email)) {
      return "Invalid Email Format";
    }
    return null;
  }

  String? passwordValidator(String? password) {
    if (password == null || password.isEmpty) {
      return "Password is required";
    }
    return null;
  }

  String? nameValidator(String? name) {
    if (name == null || name.isEmpty) {
      return "Name is required";
    }
    return null;
  }
}
