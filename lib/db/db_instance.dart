import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:simple_plan/db/queries.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final _dbInstance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _dbInstance;
  }

  DatabaseHelper._internal();

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute(DBQueries.INITIALIZE_TABLES);
  }

  Future<Database?> get database async {
    if (_database != null) return _database;

    _database = await _initDatabase();
    return _database;
  }

  Future<Database> _initDatabase() async {
    WidgetsFlutterBinding.ensureInitialized();

    final path = await getDatabasesPath();
    final databasePath = join(path, 'simpla_plan_database.db');

    return await openDatabase(
      databasePath,
      version: 1,
      onCreate: _createDatabase,
    );
  }
}
