/// message : "User created successfully"
/// data : {"email":"mazen@gmail.com","password":"$2b$10$yjEBjJTOPR//IaNI5ekrTeTOmOtLE07EDOLAHlLCmxDAENl8NKnhG","name":"mazen22","phone":"+201004466292","avaterId":1,"_id":"67a4c8f1453a48f13ba9804e","createdAt":"2025-02-06T14:36:33.156Z","updatedAt":"2025-02-06T14:36:33.156Z","__v":0}

class RegisterResponse {
  RegisterResponse({
      this.message, 
      this.data,
    this.status,

  });

  RegisterResponse.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    status=json['statusCode'];
  }
  String? message;
  Data? data;
  String ?status;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

/// email : "mazen@gmail.com"
/// password : "$2b$10$yjEBjJTOPR//IaNI5ekrTeTOmOtLE07EDOLAHlLCmxDAENl8NKnhG"
/// name : "mazen22"
/// phone : "+201004466292"
/// avaterId : 1
/// _id : "67a4c8f1453a48f13ba9804e"
/// createdAt : "2025-02-06T14:36:33.156Z"
/// updatedAt : "2025-02-06T14:36:33.156Z"
/// __v : 0

class Data {
  Data({
      this.email, 
      this.password, 
      this.name, 
      this.phone, 
      this.avaterId, 
      this.id, 
      this.createdAt, 
      this.updatedAt, 
      this.v,});

  Data.fromJson(dynamic json) {
    email = json['email'];
    password = json['password'];
    name = json['name'];
    phone = json['phone'];
    avaterId = json['avaterId'];
    id = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }
  String? email;
  String? password;
  String? name;
  String? phone;
  int? avaterId;
  String? id;
  String? createdAt;
  String? updatedAt;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['password'] = password;
    map['name'] = name;
    map['phone'] = phone;
    map['avaterId'] = avaterId;
    map['_id'] = id;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }

}