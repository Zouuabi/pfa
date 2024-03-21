bool isPasswordValid({required String password}) {
  final passwordFormat =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

  return passwordFormat.hasMatch(password.trim());
}
