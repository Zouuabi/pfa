import 'package:mongo_dart/mongo_dart.dart';

// design pattern singleton

class DataBaseService {
  /// Use this constructor the create an object from the [DataBaseService]
  /// Whenever [DataBaseService.instance] is called
  /// it returns the same instance
  factory DataBaseService.instance() {
    return _inst;
  }

  DataBaseService._internal() {
    _connect();
  }

  Db? _myDb;
  static DataBaseService _inst = DataBaseService._internal();

  get connection => _myDb;

  void _connect() async {
    try {
      _myDb = await Db.create(
        'mongodb+srv://oubeid:CyJicctvRVTTSvPd@cluster0.uvkmspx.mongodb.net/teambey?retryWrites=true&w=majority',
      );
    } catch (e) {}

    if (_myDb != null) {
      await _myDb!.open();
    }
  }
}
