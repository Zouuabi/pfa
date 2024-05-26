import 'package:mongo_dart/mongo_dart.dart';

// design pattern singleton

class DataBaseService {
  /// Use this constructor the create an object from the [DataBaseService]
  /// Whenever [DataBaseService.instance] is called
  /// it returns the same instance
  factory DataBaseService.instance() {
    return _inst;
  }

  DataBaseService._internal() {}

  static final DataBaseService _inst = DataBaseService._internal();

  Future<Db> get connection async {
    Db _myDb;
    try {
      _myDb = await Db.create(
        'mongodb+srv://oubeid:CyJicctvRVTTSvPd@cluster0.uvkmspx.mongodb.net/teambey?retryWrites=true&w=majority',
      );

      await _myDb.open();

      return _myDb;
    } catch (e) {
      throw Exception();
    }
  }
}
