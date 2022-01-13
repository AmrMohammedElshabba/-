import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/app_cubit.dart';
import 'package:news_app/cubit/app_status.dart';
import 'package:news_app/screens/search_screen.dart';

class HomeLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit = NewsCubit.get(context);
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(items: cubit.bottomNavItems,
            onTap: (index){
              cubit.changeCurrentIndex(index);
            },
            currentIndex: cubit.currentIndex,
          ),
          appBar: AppBar(
            title: Text("الجريدة"),
            actions: [
              IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> SearchScreen()));
              }, icon: Icon(Icons.search)),
              IconButton(onPressed: (){
                cubit.changeModeApp();
              }, icon: Icon(Icons.brightness_4))
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
        );

      },
    );
  }
}
