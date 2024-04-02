///
class Failure {
  ///
  const Failure({
    required this.status,
    required this.code,
    required this.message,
  });

  ///
  final int status;

  ///
  final String code;

  ///
  final String message;

  ///
  Map<String, dynamic> toJson() =>
      {'status': status, 'code': code, 'message': message};
}
