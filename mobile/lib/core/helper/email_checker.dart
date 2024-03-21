bool isEmailValid({required String email}) {
  final emailFormat =
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

  return emailFormat.hasMatch(email.trim());
}
