import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper{
  static const int _version = 1;
  static const String _databaseName = "Todo.db";

  static Future<Database> _getDB() async {
    return openDatabase(join(await getDatabasesPath(), _databaseName),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE Todo(id TEXT PRIMARY KEY, title TEXT, content TEXT)",
        );
      },
      version: _version,
    );
  }
}