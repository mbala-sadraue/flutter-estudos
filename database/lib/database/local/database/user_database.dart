import 'package:database/database/local/database.dart';
import 'package:database/database/local/sql/user_database.dart';
import 'package:database/models/user.dart';

class UserDatabase {
 static  Future<List<User>> userCreate(User user) async {
    final db = await DB.instance.database;

    final values = {'name': user.name, 'phone': user.phone,'image':user.image};
    final insert = await db.insert(UserFields.tableName, values);
    return await readAll();
  }

  static Future<List<User>>  readAll() async{
    final db = await DB.instance.database;
    final result = await db.query(
      UserFields.tableName,
    );
    return result.map( (json)=> User.fromJson(json) ).toList();
  }   

  static Future<List<User>> detele(int id) async{

   final db = await  DB.instance.database;

    await db.delete(UserFields.tableName, where: '${UserFields.id} = ?',
   whereArgs: [id]); 
   return await readAll();
  }

  static Future<void> update(User user) async {

    final db = await  DB.instance.database;
    final result =  await db.update(UserFields.tableName, user.toJon());
  }
}
