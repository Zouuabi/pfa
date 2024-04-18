import 'package:dart_frog/dart_frog.dart';

import '../../../../middleware/middleware.dart';

Handler middleware(Handler handler) {
  return handler.use(projectProvider());
}
