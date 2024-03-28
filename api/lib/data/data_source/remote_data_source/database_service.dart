import 'package:mongo_dart/mongo_dart.dart';

/// this class is used to create and establish connection database service
///
class DataBaseService {
  /// default constractor that returns an only one instance
  /// for the [DataBaseService] class
  ///
  factory DataBaseService() => _inst;

  DataBaseService._internal() {
    _connect();
  }

  /// the class object that would be consumed by all the app
  ///
  static final DataBaseService _inst = DataBaseService._internal();

  late Db _db;

  /// to get instance of the db
  Db get connection => _db;

  Future<void> _connect() async {
    try {
      // _db = await Db.create(
      //   'mongodb+srv://oubeid:CyJicctvRVTTSvPd@cluster0.uvkmspx.mongodb.net/?retryWrites=true&w=majority',
      // );
      _db = await Db.create(
        'mongodb+srv://oubeid:CyJicctvRVTTSvPd@cluster0.uvkmspx.mongodb.net/?retryWrites=true&w=majority',
      );

      if (_db.isConnected) {
        await _db.open();
      } else {
        print('\n db is not connected \n');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
