import 'dart:async';

import 'package:dart_frog/dart_frog.dart';

FutureOr<Response> onRequest(RequestContext context) async {
  // Projectz p = new Projectz(
  //     owner: User(
  //         username: 'username',
  //         phoneNumber: 'phoneNumber',
  //         gender: 'gender',
  //         birthDay: 'birthDay',
  //         interests: ['interests'],
  //         email: 'email',
  //         password: 'password',
  //         role: 'role'),
  //     title: 'title',
  //     intro: 'intro',
  //     createdAt: "createdAt",
  //     likes: 0,
  //     popularity: 0);
  // ProjectRepositoryImpl repo = new ProjectRepositoryImpl();

  // repo.create(project: p);

  return Response(body: 'Welcome to TeamBey api !');
}
