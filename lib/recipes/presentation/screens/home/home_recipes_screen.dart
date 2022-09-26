import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app_flutter/core/constants/app_colors.dart';
import 'package:recipes_app_flutter/core/service_locater/sl.dart';
import 'package:recipes_app_flutter/recipes/presentation/bloc/details_cubit/details_cubit.dart';

class HomeRecipesScreen extends StatelessWidget {
  const HomeRecipesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context)=>sl<DetailsCubit>(),
      child: BlocConsumer<DetailsCubit, DetailsState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          return  SafeArea(
            child: Scaffold(
              backgroundColor: AppColors.scuffoldBackgroundColor,
              body: Column(
                children: const [

                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
