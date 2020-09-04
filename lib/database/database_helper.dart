import 'dart:async';
import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:panet/util/constants.dart';
import 'package:panet/models/bread.dart';

class DatabaseHelper {
  static final DatabaseHelper _INSTANCE = new DatabaseHelper.make();

  factory DatabaseHelper() => _INSTANCE;

  static Database _db;

  DatabaseHelper.make();

  Future get db async {
    if (_db != null) return _db;
    _db = await initDB();
    return _db;
  }

  initDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, Constants.DBNAME);
    var myDb =
    openDatabase(path, version: Constants.DB_VERSION, onCreate: _onCreate);

    return myDb;
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE ${Constants.TABLE_NAME} "
            "(${Constants.COLUMN_ID} INTEGER PRIMARY KEY, "
            "${Constants.COLUMN_NAME} TEXT,"
            " ${Constants.COLUMN_PRICE} INTEGER "
            ");");
  }

  Future insertBread(Bread bread) async {
    var dbClient = await db;
    int count = await dbClient.insert(Constants.TABLE_NAME, bread.toMap());

    return count;
  }

  Future getCount() async {
    var dbClient = await db;
    int count = Sqflite.firstIntValue(await dbClient
        .rawQuery("SELECT COUNT(*) FROM ${Constants.TABLE_NAME}"));
    return count;
  }

  Future getSingleItem(int id) async {
    var dbClient = await db;
    var result = await dbClient.rawQuery(
        "SELECT * FROM ${Constants.TABLE_NAME} WHERE ${Constants.COLUMN_ID} = $id");
    if (result == null) return null;
    return new Bread.fromMap(result.first);
  }

  Future deleteItem(int id) async {
    var dbClient = await db;
    int count = await dbClient.delete(Constants.TABLE_NAME,
        where: "${Constants.COLUMN_ID} = ?", whereArgs: [id]);
    return count;
  }

  Future updateItem(Bread bread) async {
    var dbClient = await db;
    int count = await dbClient.update(Constants.TABLE_NAME, bread.toMap(),
        where: "${Constants.COLUMN_ID} = ?", whereArgs: [bread.id]);

    return count;
  }




}


