class User {
  User({
    this.id,
    required this.username,
    required this.phoneNumber,
    required this.gender,
    required this.birthDay,
    required this.interests,
    required this.email,
    required this.password,
    required this.role,
  });

  final String? id;
  final String role;
  final String username;
  final String email;
  final String phoneNumber;
  final String gender;
  final String birthDay;
  final List<dynamic> interests;
  final String password;

  // serialisation
  factory User.fromJson(Map<String, dynamic> json) => User(
      id: json["id"],
      gender: json['gender'],
      interests: json['interests'],
      birthDay: json['birthDay'],
      username: json['username'],
      phoneNumber: json['phoneNumber'],
      role: json['role'],
      email: json['email'],
      password: json['password']);
  // deserialistation
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "role": role,
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
