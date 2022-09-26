import 'package:dio/dio.dart';
import 'package:recipes_app_flutter/core/api_constants/api_constants.dart';
import 'package:recipes_app_flutter/core/error/server_exception.dart';
import 'package:recipes_app_flutter/core/network/error_message_model.dart';
import 'package:recipes_app_flutter/recipes/data/models/search_model.dart';
import 'package:recipes_app_flutter/recipes/domain/entities/search_model.dart';

abstract class BaseRemoteDataSource {
  Future<List<Search>> searchRecipe(String query);
}

class RemoteDataSource extends BaseRemoteDataSource{
  @override
  Future<List<SearchModel>> searchRecipe(String query) async{
    try{
      final response = await Dio().get(ApiConstants().searchPathMaker(query));
       return List<SearchModel>.from((response.data['results'] as List).map((e) => SearchModel.fromJson(e)));


    }on DioError catch(e){
     throw ServerExcepetion(errorMessageModel: ErrorMessageModel(message: e.message, statusCode: e.response?.statusCode as int, success: false));
    }
  }

}