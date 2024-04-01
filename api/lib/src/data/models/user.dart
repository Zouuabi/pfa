class User {
  User(
      {required this.username,
      required this.phoneNumber,
      required this.gender,
      required this.birthDay,
      required this.interests,
      required this.email,
      required this.password});

  final String username;
  final String email;
  final String phoneNumber;
  final String gender;
  final String birthDay;
  final List<dynamic> interests;
  final String password;

  // serialisation
  factory User.fromJson(Map<String, dynamic> json) => User(
      gender: json['gender'],
      interests: json['interests'],
      birthDay: json['birthDay'],
      username: json['username'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      password: json['password']);
  // deserialistation
  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "gender": gender,
      "birthDay": birthDay,
      "phoneNumber": phoneNumber,
      "interests": interests,
      "email": email,
      "password": password,
    };
  }
}
