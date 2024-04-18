import 'dart:async';

import 'package:dart_frog/dart_frog.dart';
import 'package:mongo_dart/mongo_dart.dart';

import '../data/models/projectz.dart';
import '../data/models/user.dart';
import '../data/repositories/project/project_repository_impl.dart';

FutureOr<Response> onRequest(RequestContext context) async {
  Projectz p = new Projectz(
      owner: User(
          username: 'username',
          phoneNumber: 'phoneNumber',
          gender: 'gender',
          birthDay: 'birthDay',
          interests: ['interests'],
          email: 'email',
          password: 'password',
          role: 'role'),
      title: 'title',
      intro: 'intro',
      createdAt: "createdAt",
      likes: 0,
      popularity: 0);
  ProjectRepositoryImpl repo = new ProjectRepositoryImpl();

  repo.create(project: p);

  return Response(body: 'Welcome to TeamBey api !');
}
