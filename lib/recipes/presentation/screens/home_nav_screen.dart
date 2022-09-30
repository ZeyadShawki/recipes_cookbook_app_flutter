import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:recipes_app_flutter/recipes/presentation/screens/home/home_recipes_screen.dart';
import 'package:recipes_app_flutter/recipes/presentation/screens/search_screen/search_screen.dart';
import 'package:recipes_app_flutter/recipes/presentation/screens/settings/settings_screen.dart';

class HomeBottomNavBar extends StatefulWidget {
  const HomeBottomNavBar({Key? key}) : super(key: key);

  @override
  State<HomeBottomNavBar> createState() => _HomeBottomNavBarState();
}

class _HomeBottomNavBarState extends State<HomeBottomNavBar> {
  final _pageViewController = PageController(initialPage: 1);
  List<Widget> screens=[
    const SearchScreen(),
    const HomeRecipesScreen(),
    const SettingScreen(),
  ];
   int _currentIndex=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: PageView(

           controller: _pageViewController,
           physics: const BouncingScrollPhysics(),
           onPageChanged: (int index){
             setState(() {
               _currentIndex=index;
             });
           },
          children: screens
      ),
    resizeToAvoidBottomInset: true,
     bottomNavigationBar:  BottomNavyBar(
       backgroundColor: Colors.white,
       selectedIndex: _currentIndex,

       items: [

         BottomNavyBarItem(icon: const Icon(Icons.search), title: const Text('search',textAlign: TextAlign.center,),activeColor: Colors.greenAccent.shade700,inactiveColor: Colors.grey),
         BottomNavyBarItem(icon: const Icon(Icons.home_outlined), title: const Text('Home',textAlign: TextAlign.center,) ,activeColor: Colors.greenAccent.shade700,inactiveColor: Colors.grey),
         BottomNavyBarItem(icon: const Icon(Icons.settings), title: const Text('settings',textAlign: TextAlign.center,),activeColor: Colors.greenAccent.shade700,inactiveColor: Colors.grey),

       ],
       onItemSelected: (int value) {
         setState(() {
           _currentIndex=value;
           _pageViewController.jumpToPage(_currentIndex);
         });
       },


     )
    );
  }
}
