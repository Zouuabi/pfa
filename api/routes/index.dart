import 'package:api/data/data_source/remote_data_source/database_service.dart';
import 'package:api/data/models/models.dart';
import 'package:api/data/repositories/user/user_repository_impl.dart';
import 'package:dart_frog/dart_frog.dart';

Response onRequest(RequestContext context) {
  UserRepositoryImpl(db: DataBaseService()).createUser(
    User(
      id: 'id',
      userName: '',
      firstName: '',
      lastName: '',
      email: 'email',
      tel: 'tel',
    ),
  );
  return Response(body: 'Welcome to TeamBey');
}
