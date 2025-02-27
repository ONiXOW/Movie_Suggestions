
import '../../domain/entities/LoginResponseEntity.dart';

class LoginResponseDm extends LoginResponseEntity {
  LoginResponseDm({
    super.message,
    super.user,
    this.statusMsg,
    super.token,
  });

  LoginResponseDm.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    user = json['user'] != null ? LoginUserDm.fromJson(json['user']) : null;
    token = json['token'];
  }

  String? statusMsg;
}

class LoginUserDm extends LoginUserEntity {
  LoginUserDm({
    super.name,
    super.email,
    this.role,
  });

  LoginUserDm.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }

  String? role;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['role'] = role;
    return map;
  }
}
