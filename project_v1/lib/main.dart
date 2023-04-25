import 'package:flutter/material.dart';


import 'package:firebase_core/firebase_core.dart';
//import 'package:project_v1/Login/meal_list.dart';
import 'package:project_v1/APIpage/api_fooddetail.dart';
import 'package:project_v1/APIpage/api_listview.dart';
import 'package:project_v1/controller/getdata_provider.dart';
import 'package:project_v1/Login/signin_page.dart';
import 'package:project_v1/Login/singup_page.dart';
import 'package:provider/provider.dart';

import 'intro.dart';
//import 'search_food.dart';
import 'home.dart';
import 'Game/opencard.dart';
import 'Game/spin.dart';

//import 'package:firebase_options.dart';



void main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    //options: DefaultFirebaseOptions.currentPlatform,
    //options: DefaultFirebaseOptions.currentPlatform,
   );
  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (ctx) => GetDataProvider()),
        ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          // '/': (BuildContext context) => const IntroductionScreen(),
          '/': (BuildContext context) => const IntroductionScreen(),
          '/home': (BuildContext context) => const HomePage(),
          '/foodlist': (BuildContext context) =>  MealsList(),
          '/fooddetail': (BuildContext context) => My_search(),
          '/searchfood': (BuildContext context) => const SpinPage(),
          '/spin': (BuildContext context) => const SpinPage(),
          '/opencard': (BuildContext context) => const OpenTheCard(),
          '/signin': (BuildContext context) =>  SinginPage(),
          '/signup': (BuildContext context) =>  singup_Page(),
        },
        initialRoute: "/", //ให้เปิดappขึ้นมาหน้าแรก
      ),
    );
  }
}
