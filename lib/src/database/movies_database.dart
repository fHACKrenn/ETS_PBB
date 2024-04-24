import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final _databaseName = "movies_database.db";
  static final _databaseVersion = 1;

  static final table = 'movies';

  static final columnId = '_id';
  static final columnName = 'name';
  static final columnDirector = 'director';
  static final columnYear = 'year';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY,
            $columnName TEXT NOT NULL,
            $columnDirector TEXT NOT NULL,
            $columnYear INTEGER NOT NULL
          )
          ''');
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(table);
  }
}

void main() async {
  // Open the database and insert some movies
  DatabaseHelper dbHelper = DatabaseHelper.instance;
  await dbHelper.insert({
    DatabaseHelper.columnName: 'Siksa Kubur',
    DatabaseHelper.columnDirector: 'Joko Anwar',
    DatabaseHelper.columnYear: 2024
  });

  // Print out the movies
  List<Map<String, dynamic>> movies = await dbHelper.queryAllRows();
  print(movies);
}
