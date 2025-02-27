class RegisterResponseEntity {
  RegisterResponseEntity({
      this.message, 
      this.data,
  this.statusCode,
    this.errorMessage
  });

  String? message;
  DataEntity? data;
  int?statusCode;
  String? errorMessage;

}

class DataEntity {
  DataEntity({
      this.email, 
      this.password, 
      this.name, 
      this.phone, 
      this.avaterId, 
      this.id, 
      this.createdAt, 
      this.updatedAt, 
      this.v,});


  String? email;
  String? password;
  String? name;
  String? phone;
  num? avaterId;
  String? id;
  String? createdAt;
  String? updatedAt;
  num? v;



}