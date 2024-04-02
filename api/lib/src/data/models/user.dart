///
class User {
  ///
  User({
    required this.username,
    required this.phoneNumber,
    required this.gender,
    required this.birthDay,
    required this.interests,
    required this.email,
    required this.password,
  });

  /// serialisation
  factory User.fromJson(Map<String, dynamic> json) => User(
        gender: json['gender'] as String,
        interests: json['interests'] as List<dynamic>,
        birthDay: json['birthDay'] as String,
        username: json['username'] as String,
        email: json['email'] as String,
        phoneNumber: json['phoneNumber'] as String,
        password: json['password'] as String,
      );

  ///
  final String username;

  ///
  final String email;

  ///
  final String phoneNumber;

  ///
  final String gender;

  ///
  final String birthDay;

  ///
  final List<dynamic> interests;

  ///
  final String password;

  /// deserialistation
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'gender': gender,
      'birthDay': birthDay,
      'phoneNumber': phoneNumber,
      'interests': interests,
      'email': email,
      'password': password,
    };
  }
}
