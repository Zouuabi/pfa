// import 'package:dart_frog/dart_frog.dart';

// Middleware authenticator() {
//   return (handler) {
//     return handler.use(
//       provider<StudentRepository>(
//         (context) => StudentRepositoryImpl(db: DatabaseService()),
//       ),
//     );
//   };
// }
// Handler middleware(Handler handler) {
//   return handler.use(authenticator());
// }