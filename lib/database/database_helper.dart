import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:student_app/model/student_model.dart';

class DatabaseHelper {
  static final DatabaseHelper instence = DatabaseHelper._internal();
  factory DatabaseHelper() => instence;
  DatabaseHelper._internal();

  Database? _database;
  final String _dbName = 'student.db';
  final String _tbName = 'studentTable';

  Future<Database> get _getDatabase async {
    if (_database != null) return _database!;
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    return await openDatabase(
      _dbName,
      version: 1,
      onCreate: _createDatabase,
    );
  }

  void _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $_tbName (
        id INTEGER PRIMARY KEY,
        name TEXT,
        age  TEXT,
        batch TEXT,
        regnum TEXT,
        imagePath TEXT
      )
    ''');
  }

  Future<Rx<Student>> addToStudentTable(Student student) async {
    final data = Student.toJson(student);
    final db = await _getDatabase;
    int id = await db.insert(_tbName, data);
    final details = await db.query(_tbName, where: 'id=?', whereArgs: [id]);
    await db.query(_tbName, where: 'id=?', whereArgs: [id]);
    final rxStudent = Student.fromStudent(details.first);
    return rxStudent;
  }

  Future<List<Map<String, dynamic>>> getAllStudent() async {
    final db = await _getDatabase;
    return await db.query(_tbName);
  }

  Future<void> deleteStudent(int id) async {
    final db = await _getDatabase;
    db.delete(_tbName, where: 'id=?', whereArgs: [id]);
  }

  Future<void> updateStudent(Student student) async {
    final db = await _getDatabase;
    final data = Student.toJson(student);
    db.update(_tbName, data, where: 'id=?', whereArgs: [student.id]);
  }
}
