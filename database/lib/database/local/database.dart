import 'package:database/database/local/sql/user_database.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DB {
  static final DB instance = DB._internal();
  DB._internal();
  static Database? _databese;

  Future<Database> get database async {
    if (_databese != null) {
      return _databese!;
    }

    _databese = await initialDatabase();
    return _databese!;
  }

  Future<Database> initialDatabase() async {
    final path = join(await getDatabasesPath(), 'kimbo.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate:_onCreate
      );
  }
  Future<void> _onCreate(Database db, int versino) async{
     await db.execute(
      '''
        CREATE TABLE ${UserFields.tableName} (
         ${UserFields.id} ${UserFields.idType},
         ${UserFields.name} ${UserFields.strType},
         ${UserFields.phone} ${UserFields.strType},
         ${UserFields.image}
        )
      '''
    );

  }


}
// // // https://medium.com/@beccasaka/using-sqlite-in-flutter-3d5a10138090
