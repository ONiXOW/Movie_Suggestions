class RegisterModel {
  String? message;
  Data? data;
  String? statusCode;

  RegisterModel({this.message, this.data,this.statusCode});
}

class Data {
  String? email;
  String? name;
  String? phone;
  String? id;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.email,
      this.name,
      this.phone,
      this.id,
      this.createdAt,
      this.updatedAt});
}
