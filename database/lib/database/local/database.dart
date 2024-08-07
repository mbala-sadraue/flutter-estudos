// import 'dart:ui';

// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';

// class DB{
//   // DB._();
//   // static DB instace = DB._();

//   static final DB instace = DB._internal();
//   static late Database _database;
//   DB._internal();


//    Future<Database> get database async{


//     if(_database != null){
//       return _database;
//     }
//     _database = await initialDatabase();
//     return _database;
//   } 


//   Future<Database> initialDatabase() async{

//     final path = join(await getDatabasesPath(),"database.bd");
//     return await openDatabase(
//       path,
//       version: 1,
//       onCreate:_onCreate
//       ); 
//   }
//   Future<void >_onCreate(Database db, version) async{
//     return await db.execute(
//       """
//          CREATE TEBLE user(
//           id INTEGER PRIMARY KEY AUTOINCREMENT,
//           name VARCHAR(300),
//           phone VARCHAR(30)
//          ) 

//       """
//       );
//   }
// }
// // // https://medium.com/@beccasaka/using-sqlite-in-flutter-3d5a10138090
