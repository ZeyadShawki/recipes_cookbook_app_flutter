import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:recipes_app_flutter/core/constants/app_colors.dart';
import 'package:recipes_app_flutter/recipes/presentation/screens/home_recipes_screen.dart';
import 'package:recipes_app_flutter/recipes/presentation/screens/search_screen/search_screen.dart';
import 'package:recipes_app_flutter/recipes/presentation/screens/settings/settings_screen.dart';

class HomeBottomNavBar extends StatefulWidget {
  const HomeBottomNavBar({Key? key}) : super(key: key);

  @override
  State<HomeBottomNavBar> createState() => _HomeBottomNavBarState();
}

class _HomeBottomNavBarState extends State<HomeBottomNavBar> {
  List<Widget> screens=[
    const SearchScreen(),
    const HomeRecipesScreen(),
    const SettingScreen(),
  ];
   int _currentIndex=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentIndex],
    resizeToAvoidBottomInset: true,
     bottomNavigationBar: CurvedNavigationBar(
       items: const [
         Icon(Icons.search, size: 30,),
         Icon(Icons.home_outlined, size: 30),
         Icon(Icons.settings, size: 30),
       ],
       height: 60,
       onTap: (int index){
         setState(() {
           _currentIndex=index;
         });
       },
       index: _currentIndex,
       backgroundColor: AppColors.scuffoldBackgroundColor,
       buttonBackgroundColor: Colors.greenAccent,
       color: Colors.white,
     ),
    );
  }
}
