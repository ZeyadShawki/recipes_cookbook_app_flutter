part of 'details_cubit.dart';

@immutable
abstract class DetailsState {}

class DetailsInitial extends DetailsState {}
class DetailsSuccessState extends DetailsState {
  final RecipeDetails recipeDetails;

  DetailsSuccessState({required this.recipeDetails});
  DetailsSuccessState copyWith(
      RecipeDetails? recipeDetails
      )=>DetailsSuccessState(recipeDetails: recipeDetails?? this.recipeDetails );

}
class DetailsLoadingsState extends DetailsState {}
class DetailsErrorState extends DetailsState {
  final String message;
  DetailsErrorState(this.message);
}
class DetailsNoInternetConnectionState extends DetailsState {}
