import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:recipes_app_flutter/core/service_locater/sl.dart';
import 'package:recipes_app_flutter/recipes/domain/entities/ingredients.dart';
import 'package:recipes_app_flutter/recipes/domain/entities/nutrients.dart';
import 'package:recipes_app_flutter/recipes/presentation/bloc/details_cubit/details_cubit.dart';

class RecipeDetailsScreen extends StatelessWidget {
  const RecipeDetailsScreen({Key? key, required this.id}) : super(key: key);
  final int id;
  @override
  Widget build(BuildContext context) {
    final ScrollController controller=ScrollController();
    return BlocProvider(
      create: (context)=>sl<DetailsCubit>()..getRecipeDetails(id),
      child: BlocConsumer<DetailsCubit, DetailsState>(
        listener: (context, state) {
        },
        builder: (context, state) {
            if(state is DetailsSuccessState) {
              return  Scaffold(
            backgroundColor: Colors.white,
            body:  SingleChildScrollView(
              controller: controller,
              physics: const BouncingScrollPhysics(),
              child: Column(

                children: [
                   Stack(
                     children: [

                       ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image(
                          fit: BoxFit.cover,
                            image: NetworkImage(
                          state.recipeDetails.image
                 )),
                  ),
                         InkWell(
                           onTap: ()=>Navigator.pop(context),
                           child: Align(
                             alignment: Alignment.topLeft,
                             child: Container(
                               margin: const EdgeInsets.symmetric(vertical: 40,horizontal: 10),
                             height: 40,
                             width: 40,
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(15),
                               color: Colors.white,
                             ),
                             child: const Icon(Icons.arrow_back_ios_new_outlined),
                       ),
                           ),
                         ),
                     ],
                   ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                     children: [
                       Padding(
                         padding: const EdgeInsets.all(10.0),
                         child: Text(
                           state.recipeDetails.title,
                           style:const TextStyle(
                             fontSize: 25,
                             fontWeight: FontWeight.w500,
                             color: Colors.black,
                           ),
                         ),
                       ),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         children: [
                         Column(
                           children: [
                             const Icon(Icons.access_time_outlined,color: Colors.greenAccent,size: 30,),
                             Text(
                               "${state.recipeDetails.readyInMinutes.toString()} min",
                               style: const TextStyle(
                                 fontWeight: FontWeight.w500
                               ),
                             )
                           ],
                         ),
                         Column(
                           children: [
                             const Icon(Icons.local_fire_department_outlined,color: Colors.greenAccent,size: 30,),
                             Text(
                               "${state.recipeDetails.nutrients[0].amount.toInt().toString()} Kcal",
                               style: const TextStyle(
                                   fontWeight: FontWeight.w500
                               ),
                             ),

                           ],
                         ),
                           InkWell(
                             onTap: (){

                             },
                             child: Column(
                               children: const [
                                 Icon(Icons.article_outlined,color: Colors.greenAccent,size: 30,),
                                 Text(
                                   "Full Recipe",
                                   style: TextStyle(
                                       fontWeight: FontWeight.w500
                                   ),
                                 ),

                               ],
                             ),
                           ),
                       ],),
                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
                         child: Text('Recipe:-',style: TextStyle(
                            color: Colors.greenAccent.shade400,
                           fontSize: 25
                         ),
                         textAlign: TextAlign.start,
                         ),
                       ),
                        SizedBox(
                          height: 180,
                          child:  SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Html(
                             data: state.recipeDetails.summary,
                               shrinkWrap: true,

                       ),
                          ),
                        ),
                         const SizedBox(height: 20,),
                         Container(
                           margin: const EdgeInsets.symmetric(horizontal: 20),
                           width: double.infinity,
                           padding: const EdgeInsets.all(10),
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(30),
                             color: Colors.grey.withOpacity(0.4)
                           ),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                             children: [
                               InkWell(
                                 onTap: (){
                                   context.read<DetailsCubit>().changeButtons(0);
                                 },
                                 child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: context.read<DetailsCubit>().button1
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'Ingredients',
                                     style: TextStyle(
                                       fontWeight: FontWeight.w500,
                                       fontSize: 22,
                                       color: Colors.white
                                     ),
                       ),
                                  ),
                        ),
                               ),
                               InkWell(
                                 onTap: (){
                                   context.read<DetailsCubit>().changeButtons(1);
                                 },
                                 child: Container(
                                   decoration: BoxDecoration(
                                       borderRadius: BorderRadius.circular(20),
                                       color:context.read<DetailsCubit>().button2
                                   ),
                                   child: const Padding(
                                     padding: EdgeInsets.all(8.0),
                                     child: Text(
                                       'Nuterition',
                                       style: TextStyle(
                                           fontWeight: FontWeight.w500,
                                           fontSize: 22,
                                           color: Colors.white
                                       ),
                                     ),
                                   ),
                                 ),
                               ),
                             ],
                           ),
                         ),
                       if(context.read<DetailsCubit>().currentIndex==0)
                       SizedBox(
                         child: ListView.builder(
                           controller: controller,
                           shrinkWrap: true,
                             itemBuilder:  (context,index)=>ingredientsListView(state.recipeDetails.ingredients[index]),
                             itemCount: state.recipeDetails.ingredients.length),
                       ),
                       if(context.read<DetailsCubit>().currentIndex==1)

                         SizedBox(
                         child: ListView.separated(
                             controller: controller,
                             shrinkWrap: true,
                             itemBuilder:  (context,index)=>nutrentsListView(state.recipeDetails.nutrients[index]),
                             itemCount: state.recipeDetails.ingredients.length,
                           separatorBuilder: (BuildContext context, int index) => const Padding(
                             padding: EdgeInsets.symmetric(horizontal: 30),
                             child: Divider(
                               thickness: 2,

                             ),
                           ),),
                       )
                     ],
                  )
                ],
              ),
            ),
          );
            }else{
              return const Scaffold(
                  backgroundColor: Colors.white,
                  body: Center(child: CircularProgressIndicator(),));
            }
        },
      ),
    );
  }

  Widget ingredientsListView(Ingredients ingredients){
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Expanded(
        child:  Expanded(
          child:  Row(
            children: [
              Image(
                height: 80,
                  width: 80,
                  image: NetworkImage(
                    'https://spoonacular.com/cdn/ingredients_100x100/${ingredients.image}',
                  )),
               Padding(
               padding: const EdgeInsets.symmetric(horizontal: 15.0),
               child:  Flexible(
                 child: Text(ingredients.name,style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,

            ),
                 ),
               ),
             ),
                const Spacer(),
                          Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey.withOpacity(0.3),

                ),
                child: Row(
                  children: [
                    Text(
                      ingredients.amount.toString(),
                    ),
                    const SizedBox(width: 10,),
                    Text(
                      ingredients.unit.toUpperCase(),
                    overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget nutrentsListView(Nutrients nutrients){
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 15),
      child: Row(
        children: [
          Text(
            nutrients.name,
            style: const TextStyle(
              fontSize: 20
            ),
          ),
          const Spacer(),
          Text(
            nutrients.amount.toString(),
            style: const TextStyle(
                fontSize: 20,

            ),
          ),
          Text(
            nutrients.unit,
            style: const TextStyle(
                fontSize: 20
            ),
          ),

        ],
      ),
    );
  }

}
