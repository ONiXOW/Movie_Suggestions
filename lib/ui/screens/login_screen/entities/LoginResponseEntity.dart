/// message : "Success Login"
/// data : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3YThjODU1OTg5NDMzMGJkOTUyYzJlZiIsImVtYWlsIjoiYW1yMjNAZ21haWwuY29tIiwiaWF0IjoxNzM5Mzc4NTU1fQ.uYXGK_qC1W9NeVhRymhri22zUt94wKid9hS81KJ9WhE"

class LoginResponseEntity {
  LoginResponseEntity({
      this.message, 
      this.data,});


  String? message;
  String? data;

}