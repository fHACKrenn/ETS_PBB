import 'dart:async';
import 'package:ets/src/pages/movie.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class MovieDatabase {
  static Database _database;
  static final MovieDatabase instance = MovieDatabase._init();

  MovieDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await _initDB('movies.db');
    return _database;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute(
      'CREATE TABLE movies(id INTEGER PRIMARY KEY, title TEXT, posterUrl TEXT, description TEXT)',
    );
  }

  Future<Movie> create(Movie movie) async {
    final db = await instance.database;
    final id = await db.insert('movies', movie.toMap());
    return movie.copy(id: id);
  }

  Future<List<Movie>> getAllMovies() async {
    final db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query('movies');
    return List.generate(maps.length, (i) {
      return Movie.fromMap(maps[i]);
    });
  }

  Future<void> update(Movie movie) async {
    final db = await instance.database;
    await db.update(
      'movies',
      movie.toMap(),
      where: 'id = ?',
      whereArgs: [movie.id],
    );
  }

  Future<void> delete(int id) async {
    final db = await instance.database;
    await db.delete(
      'movies',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
