class UserModel{
  final String? uid;
  final String name;
  final String email;

  const UserModel({
    this.uid,
    required this.name,
    required this.email,
    // required this.followers
  });


  factory UserModel.formJson(Map<String, dynamic> json){
    return UserModel(
      name: json["name"], 
      email: json["email"]
      );
  }

  Map<String, dynamic> toJson(){
    return {
        'name':name,
        'email':email,
    };
  }
}