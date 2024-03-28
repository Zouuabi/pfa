class User {
  User(
      {required this.username,
      required this.email,
      required this.phoneNumber,
      required this.password});

  final String username;
  final String email;
  final String phoneNumber;
  final String password;

  // serialisation
  factory User.fromJson(Map<String, dynamic> map) => User(
      username: map['username'],
      email: map['email'],
      phoneNumber: map['phoneNumber'],
      password: map['password']);
}
