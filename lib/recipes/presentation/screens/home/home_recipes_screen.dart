import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app_flutter/core/request_state/main_state.dart';
import 'package:recipes_app_flutter/core/service_locater/sl.dart';
import 'package:recipes_app_flutter/recipes/presentation/bloc/home_cubit/home_cubit.dart';
import 'package:recipes_app_flutter/recipes/presentation/screens/home/home_widgets/drinks_list.dart';
import 'package:recipes_app_flutter/recipes/presentation/screens/home/home_widgets/pizza_list.dart';
import 'package:recipes_app_flutter/recipes/presentation/screens/home/home_widgets/popular_list.dart';

class HomeRecipesScreen extends StatelessWidget {
  const HomeRecipesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {




    bool button1=true;
    bool button2=false;
    bool button3=false;
    bool button4=false;
    bool button5=false;
    bool button6=false;





    final ScrollController scrollController=ScrollController();


    return BlocProvider(
        create: (context)=>sl<HomeCubit>()..getListWithSearchPopular(),
      child: BlocConsumer<HomeCubit, HomeMainState>(
        listener: (context, state) {
        },
        builder: (context, state) {

            return  Scaffold(
            backgroundColor: Colors.white,
            body:  SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              controller: scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children:  [
                Padding(
                  padding: const EdgeInsets.only(top: 50,left: 20,right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: const Image(
                                fit: BoxFit.cover,
                                height: 40,
                                width: 40,
                                image: NetworkImage(
                                    'https://firebasestorage.googleapis.com/v0/b/movies-app-flutter.appspot.com/o/users_profile_image%2Fimage_picker942208515750095858.jpg?alt=media&token=95d71ca3-ce4c-49ea-9c3e-0e1b038d5fee'
                                )),
                          ),
                          const Spacer(),
                          const Icon(Icons.notifications_none_outlined,size: 30,)
                        ],
                      ),
                      const SizedBox(height: 20,),
                      const Text(
                        'Hello,Zeyad !',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      const SizedBox(height: 15,),
                      RichText(
                          text: const TextSpan(
                              children: [
                                TextSpan(
                                    text: 'Make your own food,\nstay at',
                                    style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.black
                                    )
                                ),
                                TextSpan(
                                    text: ' Home',
                                    style: TextStyle(
                                        color: Colors.greenAccent,
                                        fontSize: 25
                                    )

                                )
                              ]
                          )),
                      const SizedBox(height: 10,),
                    ],
                  ),
                ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: (){

                              button1=true;
                              button2=false;
                              button3=false;
                              button4=false;
                              button5=false;
                              button6=false;
                              context.read<HomeCubit>().getListWithSearchPopular();

                            },
                            child: Column(
                              children: [
                                Container(
                                    width: 50,
                                    height: 70,
                                    decoration: BoxDecoration(
                                        color:  button1?Colors.greenAccent:Colors.grey.withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(30)),
                                    child: const Icon(
                                      Icons.local_fire_department_outlined,
                                      size: 40,
                                    )
                                ),
                                const SizedBox(height: 5,),
                                const Text(
                                  'Popular',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,

                                  ),


                                )
                              ],
                            ),
                          ),
                          const SizedBox(width: 15,),
                          InkWell(
                            onTap: (){

                              button1=false;
                              button2=true;
                              button3=false;
                              button4=false;
                              button5=false;
                              button6=false;

                              context.read<HomeCubit>().getListWithSearchPizza();

                            },
                            child: Column(
                              children: [
                                Container(
                                    width: 50,
                                    height: 70,
                                    decoration: BoxDecoration(
                                        color:  button2?Colors.greenAccent:Colors.grey.withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(30)),
                                    child: const Icon(
                                      Icons.local_pizza_outlined,
                                      size: 40,
                                    )
                                ),
                                const SizedBox(height: 5,),
                                const Text(
                                  'Pizza',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,

                                  ),


                                )
                              ],
                            ),
                          ),
                          const SizedBox(width: 15,),
                          InkWell(
                            onTap: (){

                              button1=false;
                              button2=false;
                              button3=true;
                              button4=false;
                              button5=false;
                              button6=false;

                              context.read<HomeCubit>().getListWithSearchDrinks();

                            },
                            child: Column(
                              children: [
                                Container(
                                    width: 50,
                                    height: 70,
                                    decoration: BoxDecoration(
                                        color:  button3?Colors.greenAccent:Colors.grey.withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(30)),
                                    child: const Icon(
                                      Icons.liquor,
                                      size: 40,
                                    )
                                ),
                                const SizedBox(height: 5,),
                                const Text(
                                  'Drinks',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,

                                  ),


                                )
                              ],
                            ),
                          ),
                          const SizedBox(width: 15,),
                          InkWell(
                            onTap: (){

                              button1=false;
                              button2=false;
                              button3=false;
                              button4=true;
                              button5=false;
                              button6=false;

                            },
                            child: Column(
                              children: [
                                Container(
                                    width: 50,
                                    height: 70,
                                    decoration: BoxDecoration(
                                        color:  button4?Colors.greenAccent:Colors.grey.withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(30)),
                                    child: const Icon(
                                      Icons.icecream_outlined,
                                      size: 40,
                                    )
                                ),
                                const SizedBox(height: 5,),
                                const Text(
                                  'Dessert',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,

                                  ),


                                )
                              ],
                            ),
                          ),
                          const SizedBox(width: 15,),
                          InkWell(
                            onTap: (){

                              button1=false;
                              button2=false;
                              button3=false;
                              button4=false;
                              button5=true;
                              button6=false;

                            },
                            child: Column(
                              children: [
                                Container(
                                    width: 50,
                                    height: 70,
                                    decoration: BoxDecoration(
                                        color:  button5?Colors.greenAccent:Colors.grey.withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(30)),
                                    child: const Icon(
                                      Icons.cake_outlined,
                                      size: 40,
                                    )
                                ),
                                const SizedBox(height: 5,),
                                const Text(
                                  'Cake',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,

                                  ),


                                )
                              ],
                            ),
                          ),
                          const SizedBox(width: 15,),
                          InkWell(
                            onTap: (){

                              button1=false;
                              button2=false;
                              button3=false;
                              button4=false;
                              button5=false;
                              button6=true;

                            },
                            child: Column(
                              children: [
                                Container(
                                    width: 50,
                                    height: 70,
                                    decoration: BoxDecoration(
                                        color:  button6?Colors.greenAccent:Colors.grey.withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(30)),
                                    child: const Icon(
                                      Icons.fastfood,
                                      size: 40,
                                    )
                                ),
                                const SizedBox(height: 5,),
                                const Text(
                                  'Burger',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,

                                  ),


                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10,),
                      if(state.categoriesState==CategoriesState.popular)...[
                        const PopularRecipeList()
                      ]
                      else if(state.categoriesState==CategoriesState.pizza)...[

                        const PizzaListScreen(),
                      ] else if(state.categoriesState==CategoriesState.drinks)...[
                        const HomeDrinkList(),
                      ]
                    ],
                  ),
                )

                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget upperList(String text,IconData icon,BuildContext context){
    Color button=Colors.greenAccent;
    return  InkWell(
      onTap: (){

      },
      child: Column(
        children: [
          Container(
              width: 50,
              height: 70,
              decoration: BoxDecoration(
                  color: button,
                  borderRadius: BorderRadius.circular(30)),
              child: Icon(
                icon,
                size: 40,
              )
          ),
          const SizedBox(height: 5,),
          Text(
           text,
            style: const TextStyle(
                fontWeight: FontWeight.w500,

            ),


          )
        ],
      ),
    );
  }
}
