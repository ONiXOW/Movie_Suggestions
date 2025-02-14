/// message : "User created successfully"
/// data : {"email":"amr2333@gmail.com","password":"$2b$10$ZpmNa1G47MWXKBeDA3Og5u8YV8WMpv00XewEUTpa2S1llMOqW53LO","name":"amr mustafa","phone":"+201141209334","avaterId":1,"_id":"67adecd090f5dfc61bc9152f","createdAt":"2025-02-13T13:00:00.681Z","updatedAt":"2025-02-13T13:00:00.681Z","__v":0}

class RegisterResponseEntity {
  RegisterResponseEntity({
      this.message, 
      this.data,
    this.statusCode,
  });


  String? message;
  DataEntity? data;
int ?statusCode;


}

/// email : "amr2333@gmail.com"
/// password : "$2b$10$ZpmNa1G47MWXKBeDA3Og5u8YV8WMpv00XewEUTpa2S1llMOqW53LO"
/// name : "amr mustafa"
/// phone : "+201141209334"
/// avaterId : 1
/// _id : "67adecd090f5dfc61bc9152f"
/// createdAt : "2025-02-13T13:00:00.681Z"
/// updatedAt : "2025-02-13T13:00:00.681Z"
/// __v : 0

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
  int? avaterId;
  String? id;
  String? createdAt;
  String? updatedAt;
  int? v;
}