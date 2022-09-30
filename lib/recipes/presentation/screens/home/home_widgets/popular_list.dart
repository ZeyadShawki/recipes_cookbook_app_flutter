import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app_flutter/recipes/domain/entities/search_model.dart';
import 'package:recipes_app_flutter/recipes/presentation/bloc/home_cubit/home_cubit.dart';

import '../../../../../core/request_state/request_state.dart';
import '../../../screens/details/details_screen.dart';

class PopularRecipeList extends StatefulWidget {
  const PopularRecipeList({Key? key}) : super(key: key);

  @override
  State<PopularRecipeList> createState() => _PopularRecipeListState();
}

class _PopularRecipeListState extends State<PopularRecipeList> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeMainState>(
        builder:(context,state){

          switch(state.popularState){

            case RequestState.loadingState:
              return
                 const Center(
                  child: CircularProgressIndicator(),
                );

            case RequestState.successState:

               return   Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          color: Colors.greenAccent,
                          height: 40,
                          width: 10,
                        ),
                   const SizedBox(width: 10,),
                        const Text('Popular Recipes',style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,

                        ),


                        ),
                      ],
                    ),
                    GridView.builder(
                      shrinkWrap: true,

                      physics: const BouncingScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(

                          crossAxisCount:  2,
                          mainAxisExtent: 180,
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 5
                      ),
                      itemBuilder: (BuildContext context, int index)
                      {
                        return InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>RecipeDetailsScreen(id: state.popularRecipe[index].id)));
                            },
                            child: recipeCard(state.popularRecipe[index]));
                      },
                      itemCount: state.popularRecipe.length,
                    ),
                  ],
                );

            case RequestState.noNetworkState:
              return  Center(
                  child:   SizedBox(
                      height: MediaQuery.of(context).size.height*0.68,
                      child:  Center(child:  Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'No Internet Connection please try again',
                            style: TextStyle(
                                fontSize: 15
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 10,),
                          Icon(Icons.report_gmailerrorred_rounded,size: 70,)
                        ],
                      ),)),
                );
            case RequestState.errorState:
            return  Center(
                  child:   SizedBox(
                  height: MediaQuery.of(context).size.height*0.68,
          child:  Center(child:  Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
          Text(
          state.errorMessage,
          style: const TextStyle(
          fontSize: 15
          ),
          textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10,),
          const Icon(Icons.report_gmailerrorred_rounded,size: 70,)
          ],
          ),)),
          );

          }
        }, listener: (context,state){

    });
  }
  Widget recipeCard(Search recipe){
    return Column(
      children: [
        ClipRRect(

          borderRadius: BorderRadius.circular(15),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Image(
              height: 120,
              image:
              NetworkImage(
                  recipe.image)),
        ),
        const SizedBox(height: 10,),
        SizedBox(
          width: 150,
          child: Text(
            recipe.title,
            style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        )
      ],
    );
  }
}
