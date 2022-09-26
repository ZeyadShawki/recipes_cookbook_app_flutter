// ignore: implementation_imports
import 'package:either_dart/src/either.dart';
import 'package:recipes_app_flutter/core/error/failure.dart';
import 'package:recipes_app_flutter/core/error/server_exception.dart';
import 'package:recipes_app_flutter/recipes/data/remote_data_sources/remote_data_source.dart';
import 'package:recipes_app_flutter/recipes/domain/base_repostery/repostery.dart';
import 'package:recipes_app_flutter/recipes/domain/entities/search_model.dart';

import '../../../core/network/network_info.dart';

class Repostery extends BaseRecipeRepostery{
  final BaseRemoteDataSource remoteDataSource;
  final NetworkInfo _networkInfo;
  Repostery(this.remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, List<Search>>> searchRecipe(String query)async{
   if(await _networkInfo.isConnected) {
      try {
        final result = await remoteDataSource.searchRecipe(query);
        return Right(result);
      } on ServerExcepetion catch (e) {
        return Left(ServerFailure(e.errorMessageModel.message));
      }
    }else{
     return const Left(ServerFailure('No internet Connection'));
   }
  }
}