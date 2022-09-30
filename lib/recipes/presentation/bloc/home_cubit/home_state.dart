part of 'home_cubit.dart';


class HomeMainState {

  final CategoriesState categoriesState;

  final RequestState popularState;
  final List<Search> popularRecipe;
  final String errorMessage;

  final RequestState homePizzaState;
  final List<Search> homePizzarecipe;
  final String homePizzaerrorMessage;

  final RequestState homeDrinkState;
  final List<Search> homeDrinkRecipe;
  final String homeDrinkErrorMessage;


  HomeMainState(
      {
        this.categoriesState=CategoriesState.popular,
        this.popularState=RequestState.loadingState,
       this.popularRecipe=const [],
      this.errorMessage='',
      this.homePizzaState=RequestState.loadingState,
      this.homePizzarecipe=const [],
      this.homePizzaerrorMessage='',
        this.homeDrinkState=RequestState.loadingState,
        this.homeDrinkRecipe=const [],
        this.homeDrinkErrorMessage='',
      });

  HomeMainState copyWith({
    CategoriesState? categoriesState,
    RequestState? popularState,
    List<Search>? popularRecipe,
  String? errorMessage,

    RequestState? homePizzaState,
     List<Search>? homePizzarecipe,
     String? homePizzaerrorMessage,

     RequestState? homeDrinkState,
     List<Search>? homeDrinkRecipe,
     String? homeDrinkErrorMessage,


  }){
    return HomeMainState(
      categoriesState: categoriesState??this.categoriesState,
    popularState: popularState??this.popularState,
      popularRecipe: popularRecipe??this.popularRecipe,
      errorMessage: errorMessage??this.errorMessage,
      homePizzaState: homePizzaState??this.homePizzaState,
      homePizzaerrorMessage: homePizzaerrorMessage??this.homePizzaerrorMessage,
      homePizzarecipe: homePizzarecipe??this.homePizzarecipe,
      homeDrinkErrorMessage: homeDrinkErrorMessage??this.homeDrinkErrorMessage,
      homeDrinkRecipe: homeDrinkRecipe??this.homeDrinkRecipe,
        homeDrinkState: homeDrinkState??this.homeDrinkState,
    );
}


}

