import 'package:dio/dio.dart';
import 'package:recipes_app_flutter/core/api_constants/api_constants.dart';
import 'package:recipes_app_flutter/core/error/server_exception.dart';
import 'package:recipes_app_flutter/core/network/error_message_model.dart';
import 'package:recipes_app_flutter/recipes/data/models/populer_recipe_model.dart';
import 'package:recipes_app_flutter/recipes/data/models/recipe_details_model.dart';
import 'package:recipes_app_flutter/recipes/data/models/search_model.dart';
import 'package:recipes_app_flutter/recipes/domain/entities/popular_recipe.dart';
import 'package:recipes_app_flutter/recipes/domain/entities/recipe_deatails.dart';
import 'package:recipes_app_flutter/recipes/domain/entities/search_model.dart';

abstract class BaseRemoteDataSource {
  Future<List<Search>> searchRecipe(String query);
  Future<RecipeDetails> getRecipeDetails(int id);
  Future<List<PopularRecipe>> getPopulerRecipe();
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

  @override
  Future<RecipeDetailsModel> getRecipeDetails(int id)async {
   try {
     final response= await Dio().get(ApiConstants().getRecipeDetailsPath(id));
     return RecipeDetailsModel.fromJson(response.data);
   }on DioError catch(e){
     throw ServerExcepetion(errorMessageModel: ErrorMessageModel(message: e.message,statusCode: e.response?.statusCode as int,success: false));
   }
  }

  @override
  Future<List<PopularRecipe>> getPopulerRecipe()async{
    try {
      List<PopularRecipesModel> populerRecipes=[];
      for(int i=0;i<15;i++){
        final response =await Dio().get(
            ApiConstants().getRandomRecipePath()
        );
        populerRecipes.add(PopularRecipesModel.fromJson(response.data['recipes'][0]));
      }
      return populerRecipes;

    }on DioError catch(e){
      throw ServerExcepetion(errorMessageModel: ErrorMessageModel(message: e.message,statusCode: e.response?.statusCode as int,success: false));
    }
  }

}