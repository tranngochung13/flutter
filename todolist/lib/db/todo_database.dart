import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todolist/db/todo_table.dart';

class TodoDatabase {
  static const String DB_NAME = 'todo.db';
  static const DB_VERSION = 1;
  static Database _database = '''''' as Database;

  TodoDatabase._internal();
  static final TodoDatabase instance = TodoDatabase._internal();

  Database get database => _database;

  static const initScripts = [TodoTable.CREATE_TABLE_QUERY];
  static const migrationScripts = [TodoTable.CREATE_TABLE_QUERY];

  init() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), DB_NAME),
      onCreate: (db, version) {
        initScripts.forEach((scrip) async => await db.execute(scrip));
      },
      onUpgrade: (db, oldVersion, newVersion) {
        migrationScripts.forEach((scrip) async => await db.execute(scrip));
      },
      version: DB_VERSION,
    );
  }
}
