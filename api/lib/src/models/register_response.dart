///
class RegisterResponse {
  ///
  const RegisterResponse({
    required this.status,
    required this.data,
  });

  ///
  final int status;

  ///
  final Map<String, dynamic> data;

  ///
  Map<String, dynamic> toJson() => {'status': status, 'data': data};
}
