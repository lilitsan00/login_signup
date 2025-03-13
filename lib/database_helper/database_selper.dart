import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

abstract class DatabaseHelper {
  Future<int> registerUser(String username, String email, String password);
  Future<Map<String, dynamic>?> loginUser(String username, String password);
}

class DatabaseHelperImpl implements DatabaseHelper {
  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  static Future<Database> initDB() async {
    String path = join(await getDatabasesPath(), 'users.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE users(id INTEGER PRIMARY KEY AUTOINCREMENT, username TEXT, email TEXT, password TEXT)",
        );
      },
    );
  }

  @override
  Future<int> registerUser(
    String username,
    String email,
    String password,
  ) async {
    final db = await database;
    return await db.insert("users", {
      "username": username,
      "email": email,
      "password": password,
    });
  }

  @override
  Future<Map<String, dynamic>?> loginUser(
    String username,
    String password,
  ) async {
    final db = await database;
    List<Map<String, dynamic>> result = await db.query(
      "users",
      where: "username = ? AND password = ?",
      whereArgs: [username, password],
    );
    return result.isNotEmpty ? result.first : null;
  }
}
