class UserMoodle {
  static const String collection = "Users";
  UserMoodle({
     this.name,
     this.email,
     this.password,
     this.id,
  });

  String? name;
  String? email;
  String? password;
  String? id;

  // fromJson
 factory UserMoodle.fromJson(Map<String,dynamic>json){
    return UserMoodle(name:json['name'] ,
    email:json['email'] ,password: json['password'],id:json['id'] );
  }
  // toJson
  Map<String,dynamic>toJson(){
    return {
      'name': name,
      'email': email,
      'password': password,
      'id': id,
    };
  }

}
