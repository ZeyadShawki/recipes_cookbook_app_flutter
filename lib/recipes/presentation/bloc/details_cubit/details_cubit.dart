
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:recipes_app_flutter/core/constants/error_strings.dart';
import 'package:recipes_app_flutter/recipes/domain/entities/recipe_deatails.dart';
import 'package:recipes_app_flutter/recipes/domain/usecase/get_recipe_details_use_case.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit(this.getRecipeDetailsUseCase) : super(DetailsInitial());
  final GetRecipeDetailsUseCase getRecipeDetailsUseCase;
  int currentIndex=0;
  Color button1=Colors.greenAccent;
  Color button2=Colors.grey;
   RecipeDetails recipeDetails= const RecipeDetails(title: 'title', id: 0, readyInMinutes: 0, image: '', sourceUrl: '', summary: '', nutrients: [], ingredients: []);
  void getRecipeDetails(int id)async{
    emit(DetailsLoadingsState());
    final result= await getRecipeDetailsUseCase.execute(id);
    result.fold(
            (left) {
              if(left.message==ErrorString.noInternetconnectoion) {
                emit(DetailsErrorState(left.message));
              } else {
                emit(DetailsNoInternetConnectionState());
              }
            },
            (right) {
              recipeDetails=right;
              emit(DetailsSuccessState(recipeDetails: right));
            });
  }

  void changeButtons(int index){
    currentIndex=index;
    if(currentIndex==0){
       button1=Colors.greenAccent;
       button2=Colors.grey;
       emit(DetailsSuccessState(recipeDetails: recipeDetails));
    }else{
      button2=Colors.greenAccent;
      button1=Colors.grey;
      emit(DetailsSuccessState(recipeDetails: recipeDetails));

    }
  }

}
