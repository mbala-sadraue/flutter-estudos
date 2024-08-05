

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';


class DB{

  DB._();

  static final DB instance = DB._();

  static Database?_database;

  get database{

    if(_database != null){

      return _database;
    }

    _database = _initDatabase()
}

  Future<Database> _initDatabase() async {


    final pathData =   join(await getDatabasesPath(),'database.db');

    return openDatabase(
      pathData,
      version: 1,
      onCreate: _createDatabase
    );
  } 


  Future _createDatabase(Database db, int version){

    return await db.execute(sql);

  }
}
// https://medium.com/@beccasaka/using-sqlite-in-flutter-3d5a10138090
