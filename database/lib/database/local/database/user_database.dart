import 'package:database/database/local/database.dart';
import 'package:database/database/local/sql/user_database.dart';
import 'package:database/models/user.dart';

class UserDatabase {
  Future userCreate(User user) async {
    final db = await DB.instance.database;

    final values = {'name': user.name, 'phone': user.phone};
    final insert = db.insert(UserFields.tableName, values);
    return insert;
  }

  Future<List<User>>  readAll() async{
    final db = await DB.instance.database;
    final result = await db.query(
      UserFields.tableName,
    );
    return result.map( (json)=> User.fromJson(json) ).toList();

  }   
}
