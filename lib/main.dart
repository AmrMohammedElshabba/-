import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/home_layout.dart';
import 'package:news_app/network/dio_helper.dart';

import 'cubit/app_cubit.dart';
import 'cubit/app_status.dart';
import 'cubit/cubit_observer.dart';

void main() {
  DioHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>NewsCubit()..getBusiness()..getSports()..getScience(),
      child: BlocConsumer<NewsCubit,NewsStates>(
        listener: (context,state){},
        builder: (context,state){
          var cubit = NewsCubit.get( context);
          return MaterialApp(
            theme: ThemeData(
                primarySwatch: Colors.grey,
                appBarTheme: const AppBarTheme(
                    color: Colors.white,
                    elevation: 0.0,
                    titleTextStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                    actionsIconTheme: IconThemeData(color: Colors.black),
                    iconTheme: IconThemeData(
                      color: Colors.black,
                    )),
                backgroundColor: Colors.white,
                textTheme: const TextTheme(
                    bodyText1: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500)),
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                    backgroundColor: Colors.white,
                    elevation: 100.0,
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: Colors.black,
                    unselectedItemColor: Colors.grey)),
            darkTheme: ThemeData(
                primarySwatch: Colors.grey,
                appBarTheme: const AppBarTheme(
                    color: Colors.black38,
                    elevation: 0.0,
                    titleTextStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    actionsIconTheme: IconThemeData(color: Colors.white),
                    iconTheme: IconThemeData(
                      color: Colors.white,
                    )),
                scaffoldBackgroundColor: Colors.white10,
                backgroundColor: Colors.black38,
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                    backgroundColor: Colors.black38,
                    elevation: 100.0,
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: Colors.white,
                    unselectedItemColor: Colors.grey),
                textTheme: const TextTheme(
                    bodyText1: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500))),
            themeMode: cubit.isLight? ThemeMode.light : ThemeMode.dark,
            home:
            Directionality(textDirection: TextDirection.rtl, child: HomeLayout()),
          );
        },
      ),
    );
  }
}
