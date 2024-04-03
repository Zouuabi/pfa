import 'package:dart_frog/dart_frog.dart';

import '../data/repositories/user/user_repository_impl.dart';

Response onRequest(RequestContext context) {
  final result = UserRepositoryImpl().verifyToken(
      token:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjEiLCJyb2xlIjoiaW5kaXZpZHVhbCIsImVtYWlsIjoidXNlckBleGFtcGxlLmNvbSIsImlhdCI6MTcxMjA5NTk2NSwiZXhwIjoxNzEyMDk1OTcwfQ.P2Q7ceqy3kwF09BhIDRcTXmBQHvW0GtrCnDuZ50O1NQ');
  return Response(body: '$result');
}
