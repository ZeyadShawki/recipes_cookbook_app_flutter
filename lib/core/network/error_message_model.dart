class ErrorMessageModel implements Exception{
  String message;
  int statusCode;
  bool success;
  ErrorMessageModel({
    required this.message,
    required this.statusCode,
    required this.success
});

  factory ErrorMessageModel.fromJson(Map<String,dynamic> json)=>ErrorMessageModel(
      message: json['message'],
      statusCode: json['code'],
      success: json['success']??false);

}