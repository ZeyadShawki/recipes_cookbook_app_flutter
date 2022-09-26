
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:recipes_app_flutter/core/network/network_info.dart';
import 'package:recipes_app_flutter/recipes/data/remote_data_sources/remote_data_source.dart';
import 'package:recipes_app_flutter/recipes/data/reposteries/repostery.dart';
import 'package:recipes_app_flutter/recipes/domain/base_repostery/repostery.dart';
import 'package:recipes_app_flutter/recipes/domain/usecase/search_use_case.dart';
import 'package:recipes_app_flutter/recipes/presentation/bloc/search_cubit/search_cubit.dart';

final GetIt sl=GetIt.instance;

class ServiceLocater{

  void init()async{


    sl.registerFactory<SearchCubit>(() => SearchCubit(SearchUseCase(sl())));

    sl.registerLazySingleton<SearchUseCase>(() => SearchUseCase(sl()));

    sl.registerLazySingleton<BaseRecipeRepostery>(() => Repostery(sl(),sl()));
    sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(InternetConnectionChecker()));
    sl.registerLazySingleton<BaseRemoteDataSource>(() => RemoteDataSource());
  }

}