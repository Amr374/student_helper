import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:studenthelper/admin_screens/admin_home.dart';
import 'package:studenthelper/bloc_observer.dart';

import 'package:studenthelper/layout/bottom_nav_bar.dart';
import 'package:studenthelper/providers/cubit.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:studenthelper/providers/favourtie_cubit.dart';
import 'package:studenthelper/screens/home_page.dart';

import 'admin_cubit/admin_cubit.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  // final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:
      [
        BlocProvider(create: (BuildContext context) => StudentCubit(),),
        // BlocProvider(create: (BuildContext context) => FavouritesCubit(),),

        BlocProvider(create: (BuildContext context) => AdminCubit(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(

            scaffoldBackgroundColor:  Colors.deepPurple[50],

            appBarTheme: AppBarTheme(
              color: Colors.purple[900] ,
              // backgroundColor: Colors.purple[900],
              // backwardsCompatibility: false,
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.purple[900],
                statusBarIconBrightness: Brightness.light,
              ),
              titleTextStyle: const TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
              centerTitle: true,

            ),

        ),

        home: MyHomePage(),
      ),
    );
  }
}