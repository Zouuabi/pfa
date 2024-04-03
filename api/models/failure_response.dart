class Failure {
  const Failure({
    required this.status,
    required this.message,
  });

  final int status;
  final String message;

  Map<String, dynamic> toJson() => {'status': status, 'message': message};
}
