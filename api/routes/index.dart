import 'dart:async';

import 'package:dart_frog/dart_frog.dart';

import '../data/models/projectz.dart';
import '../data/models/user.dart';
import '../data/repositories/project/project_repository_impl.dart';

FutureOr<Response> onRequest(RequestContext context) async {
  final _repo = ProjectRepositoryImpl();
  final project = Projectz(
      description: 'sdflksjflkqsjflkdsfj',
      keywords: ['sdflksjdf', 'sdfsdfdsf'],
      id: 'sdfksfdjldfs',
      owner: User(
          id: 'sdfdsfsf',
          username: 'username',
          phoneNumber: 'phoneNumber',
          gender: 'gender',
          birthDay: 'birthDay',
          interests: [],
          email: 'email',
          password: 'password',
          role: 'role'),
      title: 'title',
      intro: 'intro',
      createdAt: DateTime.now().toUtc(),
      likes: 0,
      popularity: 0);
  final result = await _repo.create(project: project);
  return Response(body: '${project.toJson()}');
}
