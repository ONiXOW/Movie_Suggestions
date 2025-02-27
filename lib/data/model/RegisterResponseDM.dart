import 'package:movie_suggestions/domain/entities/RegisterResponseEntity.dart';

class RegisterResponseDm extends RegisterResponseEntity {
  RegisterResponseDm({
     super.data,
  super.errorMessage,
  super.message,
  super.statusCode,});

  RegisterResponseDm.fromJson(dynamic json) {
    message = json['message'];
    statusCode = json['statusCode'];
    errorMessage = json['message'];
    data = json['data'] != null ? DataDM.fromJson(json['data']) : null;
  }



}

class DataDM extends DataEntity {
  DataDM({
      super.email,
    super.password,
    super.name,
    super.phone,
    super.avaterId,
    super.id,
    super.createdAt,
    super.updatedAt,
    super.v,});

  DataDM.fromJson(dynamic json) {
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