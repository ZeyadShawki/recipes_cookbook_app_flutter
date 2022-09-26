import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app_flutter/core/constants/app_colors.dart';
import 'package:recipes_app_flutter/core/service_locater/sl.dart';
import 'package:recipes_app_flutter/recipes/domain/entities/search_model.dart';
import 'package:recipes_app_flutter/recipes/presentation/bloc/search_cubit/search_cubit.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context)=>sl<SearchCubit>(),
        child: BlocConsumer<SearchCubit,SearchState>(
          builder: (context,state){
            return Scaffold(
               
              backgroundColor: AppColors.scuffoldBackgroundColor,
              body:  SafeArea(
                child:  Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextField(
                          controller: searchController,
                          textAlign: TextAlign.start,
                          keyboardType: TextInputType.text,
                          onSubmitted: (value){
                            context.read<SearchCubit>().search(value);
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search,color: Colors.greenAccent.shade400,),
                            hintText: 'Search recipes...',
                            hintStyle: const TextStyle(fontSize: 16),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),

                            ),
                            filled: true,
                            contentPadding: const EdgeInsets.all(16),
                            fillColor: Colors.white,
                          ),
                        ),
                       const SizedBox(height: 20,),
                          if(state is SearchErrorNoInternetConnectionState)...[
                            SizedBox(
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
                                ),))
                          ],
                          if(state is SearchLoadingState)...[
                             SizedBox(
                                 height: MediaQuery.of(context).size.height*0.68,
                                 child: const Center(child: CircularProgressIndicator(),))
                          ],
                          if(state is SearchSuccessState)...[
                            SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Found',
                                     textAlign: TextAlign.start,
                                     style: TextStyle(
                                     color: Colors.black,

                                     fontSize: 30,
                                     fontWeight: FontWeight.bold
                           ),),
                                    Text('${state.recipesList.length} recipes based on your prefereneces',
                                      textAlign: TextAlign.start,
                                      style: const TextStyle(
                                          color: Colors.black,

                                          fontSize: 15,
                                          fontWeight: FontWeight.bold
                                      ),),
                                    const SizedBox(height: 20,),
                                  ],
                                ),
                              ),
                            ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height*0.68,
                            child: GridView.builder(
                              physics: const BouncingScrollPhysics(),
                               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                 crossAxisCount: 2,
                                   mainAxisExtent: 180,
                                   crossAxisSpacing: 5,
                                   mainAxisSpacing: 5
                               ),
                             itemBuilder: (BuildContext context, int index)
                             {
                               return gridItem(state.recipesList[index]);
                             },
                             itemCount: state.recipesList.length,
                         ),
                          ),
                          ]

                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          listener: (context,state){

          },
        ),
    );
  }

  Widget gridItem(Search recipe){
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
          ),
        )
      ],
    );
  }


}
