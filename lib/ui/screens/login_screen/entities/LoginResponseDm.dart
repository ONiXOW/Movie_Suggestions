
import 'LoginResponseEntity.dart';
/// message : "Success Login"
/// data : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3YThjODU1OTg5NDMzMGJkOTUyYzJlZiIsImVtYWlsIjoiYW1yMjNAZ21haWwuY29tIiwiaWF0IjoxNzM5Mzc4NTU1fQ.uYXGK_qC1W9NeVhRymhri22zUt94wKid9hS81KJ9WhE"
///
class LoginResponseDm extends LoginResponseEntity {
  LoginResponseDm({
      super.message,
     super.data,});

  LoginResponseDm.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['data'] = data;
    return map;
  }

}