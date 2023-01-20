class UserModel
{
  String Email;
  String Password;

  UserModel({required this.Email,required this.Password});


  factory UserModel.fromJson(Map<String , dynamic> json)
  {
    return UserModel(Email: json['email'], Password:json['password']);
  }
}