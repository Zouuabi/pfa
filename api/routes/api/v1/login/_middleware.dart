import 'package:dart_frog/dart_frog.dart';

import '../../../../data/repositories/user/user_repository_impl.dart';

Handler middleware(Handler handler) {
  return handler
      .use(provider<UserRepositoryImpl>((context) => UserRepositoryImpl()));
}
