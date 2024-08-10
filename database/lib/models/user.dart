import 'package:database/database/local/sql/user_database.dart';

class User{
  final int? id;
  final String name;
  final String phone;
  final String? image;

  const User({
    this.id,
    this.image,
    required this.name,
    required this.phone
  });

  factory User.fromJson(Map<String, dynamic> json){
      return json.containsKey('id')?
       User(
        image: json["image"] ?? '',
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