import 'package:database/database/local/database.dart';
import 'package:database/database/local/sql/user_database.dart';
import 'package:database/models/user.dart';

class UserDatabase {
 static  Future userCreate(User user) async {
    final db = await DB.instance.database;

    final values = {'name': user.name, 'phone': user.phone};
    final insert = db.insert(UserFields.tableName, values);
    return insert;
  }

  static Future<List<User>>  readAll() async{
    final db = await DB.instance.database;
    final result = await db.query(
      UserFields.tableName,
    );
    return result.map( (json)=> User.fromJson(json) ).toList();
  }   

  static Future<void> detele(int id) async{

   final db = await  DB.instance.database;

   final result = await db.delete(UserFields.tableName, where: '${UserFields.id} = ?',
   whereArgs: [id]); 
   print("result; $result");
  }

  static Future<void> update(User user) async {



  }
}
