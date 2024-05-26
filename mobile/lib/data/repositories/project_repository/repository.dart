import 'package:dartz/dartz.dart';
import 'package:mobile/data/models/failure.dart';
import 'package:mobile/data/models/user.dart';

abstract class Repository {
  Future<Either<void, Failure>> postProject({
    required String title,
    required String introduction,
    required String description,
    required List<String> keywords,
    required Map<String, dynamic> user,
  });
}
