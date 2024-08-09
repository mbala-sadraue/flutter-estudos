import 'package:database/database/local/sql/user_database.dart';

class User{
  final int? id;
  final String name;
  final String phone;

  const User({
    this.id,
    required this.name,
    required this.phone
  });

  factory User.fromJson(Map<String, dynamic> json){
      return json.containsKey('id')?
       User(
        name: json['name'], 
        phone: json['phone'],
        id:json['id']):  User(
        name: json['name'], 
        phone: json['phone']);
  }

  Map<String, Object> toJon(){
    return {
      UserFields.name:name,
      UserFields.phone:phone
    };
  }
}