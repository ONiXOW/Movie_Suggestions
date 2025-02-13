import 'package:movie_suggestions/ui/screens/register_screen/auth/RegisterResponseEntity.dart';

/// message : "User created successfully"
/// data : {"email":"amr23333@gmail.com","password":"$2b$10$lE3Gus7KmZPoI2m3XXqEdulWNZ4PhV.JLzqWVaXCATNb0VZGccl.a","name":"amr mustafa","phone":"+201141209334","avaterId":1,"_id":"67adeed190f5dfc61bc91534","createdAt":"2025-02-13T13:08:33.787Z","updatedAt":"2025-02-13T13:08:33.787Z","__v":0}

class RegisterResponseDm extends RegisterResponseEntity {
  RegisterResponseDm({
      super.message,
      super.data,});

  RegisterResponseDm.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'] != null ? DataDm.fromJson(json['data']) : null;
  }

}

/// email : "amr23333@gmail.com"
/// password : "$2b$10$lE3Gus7KmZPoI2m3XXqEdulWNZ4PhV.JLzqWVaXCATNb0VZGccl.a"
/// name : "amr mustafa"
/// phone : "+201141209334"
/// avaterId : 1
/// _id : "67adeed190f5dfc61bc91534"
/// createdAt : "2025-02-13T13:08:33.787Z"
/// updatedAt : "2025-02-13T13:08:33.787Z"
/// __v : 0

class DataDm extends DataEntity {
  DataDm({
    super.email,
      super.password,
      super.name,
      super.phone,
      super.avaterId,
      super.id,
      super.createdAt,
      super.updatedAt,
      super.v,});

  DataDm.fromJson(dynamic json) {
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