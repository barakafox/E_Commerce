class RegisterModel{
  bool status;
  String message;

  RegisterModel({required this.status, required this.message});

  factory RegisterModel.fromjson(Map<String,dynamic> json){
     return RegisterModel(status: json['status'], message: json['message']);
  }
}