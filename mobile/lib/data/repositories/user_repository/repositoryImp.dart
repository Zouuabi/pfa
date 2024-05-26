import 'dart:convert';
import 'dart:io';

import 'package:mobile/data/models/failure.dart';
import 'package:mobile/data/models/user.dart';
import 'package:mobile/data/repositories/user_repository/repository.dart';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';

class RepositoryImp implements Repository {
  @override
  Future<Either<User, Failure>> login(
      {required String email, required String password}) async {
    String url = "https://pfa.globeapp.dev/api/v1/login";
    final Map<String, dynamic> data;
    final http.Response response;
    try {
      final http.Client client = http.Client();
      response = await client.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );
    } catch (e) {
      return right(Failure(errorMessage: 'Something went wrong'));
    }
    if (response.body == '') {
      data = {};
    } else {
      data = jsonDecode(response.body) as Map<String, dynamic>;
    }

    if (response.statusCode == HttpStatus.ok) {
      User user = User.fromJson(data);
      return left(user);
    } else {
      Failure failure = Failure(
          errorMessage: data['message'] ?? 'something went wrong ! try again');
      return right(failure);
    }
  }

  @override
  Future<Either<void, Failure>> register(
      {required Map<String, dynamic> user}) async {
    String url = "https://pfa.globeapp.dev/api/v1/register";
    final Map<String, dynamic> data;
    final http.Response response;
    try {
      final http.Client client = http.Client();
      response = await client.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(user),
      );
    } catch (e) {
      return right(Failure(errorMessage: 'Something went wrong'));
    }
    if (response.body == '') {
      data = {};
    } else {
      data = jsonDecode(response.body) as Map<String, dynamic>;
    }

    if (response.statusCode == HttpStatus.ok) {
      return left(null);
    } else {
      Failure failure = Failure(
          errorMessage: data['message'] ?? 'something went wrong ! try again');
      return right(failure);
    }
  }
}
