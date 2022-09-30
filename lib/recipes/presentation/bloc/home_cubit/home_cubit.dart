// ignore: depend_on_referenced_packages
import 'dart:math';

// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:recipes_app_flutter/core/constants/error_strings.dart';
import 'package:recipes_app_flutter/core/request_state/main_state.dart';
import 'package:recipes_app_flutter/core/request_state/request_state.dart';
import 'package:recipes_app_flutter/recipes/domain/entities/search_model.dart';
import 'package:recipes_app_flutter/recipes/domain/usecase/get_populer_recipes_use_case.dart';
import 'package:recipes_app_flutter/recipes/domain/usecase/search_use_case.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeMainState> {
  HomeCubit(this.getPopularRecipeUseCase, this.searchUseCase) : super(HomeMainState());
  static HomeCubit get(context) =>BlocProvider.of(context);

  final GetPopularRecipeUseCase getPopularRecipeUseCase;
  final SearchUseCase searchUseCase;
  static const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  final Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));






  void getListWithSearchPizza()async{
    emit(state.copyWith(
        categoriesState: CategoriesState.pizza
    ));
    final resualt=await searchUseCase.execute('pizza');
    resualt.fold((left) {

      if(left.message==ErrorString.noInternetconnectoion) {
        emit(state.copyWith(

            homePizzaState : RequestState.noNetworkState
        ));
      } else{
        emit(state.copyWith(
            homePizzaerrorMessage: left.message,
            homePizzaState : RequestState.errorState,
        ));
      }
    }, (right) {
      emit(state.copyWith(
          homePizzaState: RequestState.successState,
          homePizzarecipe :right
      ));
    });
  }
  void getListWithSearchPopular()async{
    emit(state.copyWith(
        categoriesState: CategoriesState.popular
    ));
    final resualt=await searchUseCase.execute(getRandomString(0));
    resualt.fold((left) {

      if(left.message==ErrorString.noInternetconnectoion) {
        emit(state.copyWith(

            popularState : RequestState.noNetworkState
        ));
      } else{
        emit(state.copyWith(
          errorMessage: left.message,
          popularState : RequestState.errorState,
        ));
      }
    }, (right) {
      emit(state.copyWith(
          popularState: RequestState.successState,
          popularRecipe :right
      ));
    });
  }

  void getListWithSearchDrinks()async{
    emit(state.copyWith(
        categoriesState: CategoriesState.drinks
    ));
    final resualt=await searchUseCase.execute('drinks');
    resualt.fold((left) {

      if(left.message==ErrorString.noInternetconnectoion) {
        emit(state.copyWith(

            homeDrinkState : RequestState.noNetworkState
        ));
      } else{
        emit(state.copyWith(
          homeDrinkErrorMessage: left.message,
          homeDrinkState : RequestState.errorState,
        ));
      }
    }, (right) {
      emit(state.copyWith(
          homeDrinkState: RequestState.successState,
          homeDrinkRecipe :right
      ));
    });
  }


}
