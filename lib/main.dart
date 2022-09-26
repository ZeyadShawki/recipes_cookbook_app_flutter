import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recipes_app_flutter/core/service_locater/sl.dart';
import 'package:recipes_app_flutter/recipes/presentation/screens/home/home_nav_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 ServiceLocater().init();

  SystemChrome.setSystemUIOverlayStyle( const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
  ));

  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      darkTheme:  ThemeData.dark(),
      themeMode: ThemeMode.light,
      home: const HomeBottomNavBar(),
    );
  }
}
