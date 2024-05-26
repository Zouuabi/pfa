import 'dart:convert';
import 'dart:io';
import 'package:mobile/data/models/failure.dart';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import 'package:mobile/data/models/user.dart';
import 'package:mobile/data/repositories/project_repository/repository.dart';

class RepositoryImp implements Repository {
  @override
  Future<Either<void, Failure>> postProject({
    required String title,
    required String introduction,
    required String description,
    required List<String> keywords,
    required Map<String, dynamic> user,
  }) async {
    String url = "https://pfa.globeapp.dev/api/v1/project";
    final http.Response response;
    try {
      final http.Client client = http.Client();
      response = await client.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'owner': user,
          'title': title,
          'intro': introduction,
          'description': description,
          'keywords': keywords,
          'createdAt': DateTime.now(),
          'members': [],
          'likes': 0,
          'popularit': 0,
        }),
      );
    } catch (e) {
      return right(Failure(errorMessage: 'Something went wrong'));
    }

    if (response.statusCode == HttpStatus.ok) {
      return left(null);
    } else {
      Failure failure =
          Failure(errorMessage: 'something went wrong ! try again');
      return right(failure);
    }
  }
}
