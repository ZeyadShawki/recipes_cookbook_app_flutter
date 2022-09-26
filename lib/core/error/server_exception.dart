import 'package:recipes_app_flutter/core/network/error_message_model.dart';

class ServerExcepetion implements Exception{
  final ErrorMessageModel errorMessageModel;

  ServerExcepetion({required this.errorMessageModel});

}
class LocalDataBaseException implements Exception{
  final ErrorMessageModel errorMessageModel;
  LocalDataBaseException({required this.errorMessageModel});
}