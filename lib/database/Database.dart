import 'dart:async';

import 'package:panet/models/bread.dart';
import 'package:panet/util/constants.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class MyDB {
  static final MyDB myDB = new MyDB.local();

  factory MyDB()=> myDB;
  MyDB.local();

  Database _db;

  Future<Database> get db async {

    if (_db != null) {
      return _db;
    }

    _db = await makeDB();
    return _db;

  }

  makeDB() async {

    var dbpath = await getDatabasesPath();
    var path   = join(dbpath , "panetdb.db");

    var mydb   = await openDatabase(path , version: 1 , onCreate: _onCreate);
    return mydb;
  }


  Future<void> _onCreate(Database db, int version) async{
    await db.execute("CREATE TABLE ${Constants.TABLE_NAME} ("
        "${Constants.COLUMN_ID}    INTEGER PRIMARY KEY , "
        "${Constants.COLUMN_NAME}  TEXT , "
        "${Constants.COLUMN_PRICE} INTEGER , "
        "${Constants.COLUMN_IMAGE} TEXT"
        ")"
    );

  }

  /* Add Bread */

  Future<int> addBread(Bread bread) async{

    var myClient = await db;
    var result = myClient.insert(
      Constants.TABLE_NAME,
      bread.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace
    );

    return result;
  }

  /* Get All Data */

  Future<List> getAllRecords(tableName) async {

    var myClient = await db;

    var result = myClient.rawQuery("SELECT * FROM $tableName");
    return result;
  }

  void deleteAllItems(tableName) async {

    var myClient = await db;

    myClient.delete(
      tableName,
      where: "1"
    );

  }

}

