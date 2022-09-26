// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:recipes_app_flutter/recipes/domain/usecase/search_use_case.dart';

import '../../../domain/entities/search_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchUseCase) : super(SearchInitial());

  final SearchUseCase searchUseCase;

  void search(String query)async{
    emit(SearchLoadingState());
    final result=await  searchUseCase.execute(query);
    result.fold((left) {
      if(left.message=='No internet Connection') {
        emit(SearchErrorNoInternetConnectionState());
      } else{
        emit(SearchErrorState(left.message));
      }
    }, (right) {
      emit(SearchSuccessState(right));
    });
  }

}
