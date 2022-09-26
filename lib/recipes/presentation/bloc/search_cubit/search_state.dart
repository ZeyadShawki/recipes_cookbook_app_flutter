part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}
class SearchLoadingState extends SearchState {}
class SearchSuccessState extends SearchState {
  final List<Search> recipesList;

  SearchSuccessState(this.recipesList);
}
class SearchErrorState extends SearchState {
  final String errorMessage;

  SearchErrorState(this.errorMessage);

}
class SearchErrorNoInternetConnectionState extends SearchState {


}
