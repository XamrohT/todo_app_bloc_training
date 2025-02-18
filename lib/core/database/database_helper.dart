import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app_bloc/feature/data/models/todo_model.dart';

class DatabaseHelper {
  static const int _version = 1;
  static const String _databaseName = "Todo.db";

  static Future<Database> _getDB() async {
    const String tableTodo = 'todo';
    const String columnId = '_id';
    const String columnTitle = 'title';
    const String columnContent = 'content';
    return openDatabase(
      join(await getDatabasesPath(), _databaseName),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE $tableTodo($columnId TEXT PRIMARY KEY, $columnTitle TEXT, $columnContent TEXT)",
        );
      },
      version: _version,
    );
  }

  Future<TodoModel> insert(TodoModel todo) async {
    final Database db = await _getDB();
    await db.insert('todo', todo.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return todo;
  }
  
  Future<List<TodoModel>> getAll() async{
    final Database db = await _getDB();
    List<Map<String,Object?>> maps = await db.query('todo');
    final data = maps.map((todos) => TodoModel.fromJson(todos)).toList();
    return data;
  }

  Future<void> remove(String id) async{
    final Database db = await _getDB();
    await db.delete('todo', where: '_id = ?', whereArgs: [id]);
  }

}
