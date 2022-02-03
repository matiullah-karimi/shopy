bool isValidEmail(String email) {
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}

String? emailValidator(String? email) {
  if (email!.isEmpty) {
    return 'Please enter your email';
  }

  if (!isValidEmail(email)) {
    return 'Please enter a valid email';
  }

  return null;
}

String? passwordValidator(String? password) {
  if (password!.isEmpty) {
    return 'Please enter your password';
  }

  if (password.length < 6) {
    return 'Password must be at least 6 characters';
  }

  return null;
}

String? nameValidator(String? name) {
  if (name!.isEmpty) {
    return 'Please enter your name';
  }

  if (name.length < 3) {
    return 'Name must be at least 3 characters';
  }

  return null;
}
