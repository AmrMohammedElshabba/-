import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/app_status.dart';
import 'package:news_app/network/dio_helper.dart';
import 'package:news_app/screens/business_screen.dart';
import 'package:news_app/screens/scinces_screen.dart';
import 'package:news_app/screens/search_screen.dart';
import 'package:news_app/screens/sports_screen.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomNavItems = const [
    BottomNavigationBarItem(
        icon: Icon(
          Icons.business,
        ),
        label: "تجارة"),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: "علوم"),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: "رياضة"),
//    BottomNavigationBarItem(icon: Icon(Icons.settings), label: "الاعدادات"),
  ];

  bool isLight=true;
  void changeModeApp(){
    isLight = !isLight;
    emit(AppMode());
  }

  List<Widget> screens = [
    BusinessScreen(),
    ScincesScreen(),
    SportsScreen(),
//    SettingsScreen(),
  ];
  void changeCurrentIndex(int index) {
    currentIndex = index;
    emit(BottomNavState());
  }

  List<dynamic> business = [];
  void getBusiness() {
    DioHelper.getData(url:'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'business',
      'apiKey': '465c83985f754ee0a7b1a4733ef5dcde'
    })
        .then((value) => {
              business = value.data['articles'],
              print(business[0]),
              emit(NewsGetBusinessSuccessData())
            })
        .catchError((error) {
      print(error.toString());
      emit(NewsGetBusinessErrorData(error.toString()));
    });
  }
  List<dynamic> sports = [];
  void getSports() {
    DioHelper.getData(url:'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'sports',
      'apiKey': '465c83985f754ee0a7b1a4733ef5dcde'
    })
        .then((value) => {
    sports = value.data['articles'],
    print(business[0]),
    emit(NewsGetSportsSuccessData())
    })
        .catchError((error) {
      print(error.toString());
      emit(NewsGetSportsErrorData(error.toString()));
    });
  }
  List<dynamic> science = [];
  void getScience() {
    DioHelper.getData(url:'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'science',
      'apiKey': '465c83985f754ee0a7b1a4733ef5dcde'
    })
        .then((value) => {
    science = value.data['articles'],
    print(science[0]),
    emit(NewsGetScienceSuccessData())
    })
        .catchError((error) {
      print(error.toString());
      emit(NewsGetScienceErrorData(error.toString()));
    });
  }
  List<dynamic> search = [];
  void getSearch(String value) {
    print(value.toString());
    DioHelper.getData(url:'v2/everything', query: {
      'q': value,
      'apiKey': '465c83985f754ee0a7b1a4733ef5dcde'
    })
        .then((value) => {
    search = value.data['articles'],
    print(search[0]),
    emit(NewsSearchSuccess())
    })
        .catchError((error) {
      print(error.toString());
      emit(NewsSearchError(error.toString()));
    });
  }
}
