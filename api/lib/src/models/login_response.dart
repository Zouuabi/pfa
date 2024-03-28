class LoginResponse {
  LoginResponse({
    required this.message,
    required this.token,
  });

  final String message;
  final String? token;

  // deserialisation
  Map<String, dynamic> tojson() {
    return {
      'message': this.message,
      'token': this.token ?? '',
    };
  }
}
