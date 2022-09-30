
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:recipes_app_flutter/core/network/network_info.dart';
import 'package:recipes_app_flutter/recipes/data/remote_data_sources/remote_data_source.dart';
import 'package:recipes_app_flutter/recipes/data/reposteries/repostery.dart';
import 'package:recipes_app_flutter/recipes/domain/base_repostery/repostery.dart';
import 'package:recipes_app_flutter/recipes/domain/usecase/get_populer_recipes_use_case.dart';
import 'package:recipes_app_flutter/recipes/domain/usecase/get_recipe_details_use_case.dart';
import 'package:recipes_app_flutter/recipes/domain/usecase/search_use_case.dart';
import 'package:recipes_app_flutter/recipes/presentation/bloc/details_cubit/details_cubit.dart';
import 'package:recipes_app_flutter/recipes/presentation/bloc/home_cubit/home_cubit.dart';
import 'package:recipes_app_flutter/recipes/presentation/bloc/search_cubit/search_cubit.dart';

final GetIt sl=GetIt.instance;

class ServiceLocater{

  void init()async{

    // bloc dependency injections

    sl.registerFactory<SearchCubit>(() => SearchCubit(sl()));
    sl.registerFactory<DetailsCubit>(() => DetailsCubit(sl()));
    sl.registerFactory<HomeCubit>(() => HomeCubit(sl(),sl()));

    // use cases dependency injections
    sl.registerLazySingleton<GetPopularRecipeUseCase>(() => GetPopularRecipeUseCase(sl()));
    sl.registerLazySingleton<SearchUseCase>(() => SearchUseCase(sl()));
    sl.registerLazySingleton<GetRecipeDetailsUseCase>(() => GetRecipeDetailsUseCase(sl()));

    // repositery and remote data sources dependency injections

    sl.registerLazySingleton<BaseRecipeRepostery>(() => Repostery(sl(),sl()));
    sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(InternetConnectionChecker()));
    sl.registerLazySingleton<BaseRemoteDataSource>(() => RemoteDataSource());
  }

}