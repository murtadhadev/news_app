import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_app/cubit/states.dart';
import 'package:news_app/modules/news_app/business/business_screen.dart';
import 'package:news_app/modules/news_app/science/science_screen.dart';
import 'package:news_app/modules/news_app/sports/sport_screen.dart';
import 'package:news_app/shared/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates>{
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems =[
    BottomNavigationBarItem(icon: Icon(Icons.business),label: 'اعمال'),
    BottomNavigationBarItem(icon: Icon(Icons.sports_volleyball_outlined),label: 'رياضة'),
    BottomNavigationBarItem(icon: Icon(Icons.science),label: 'علوم'),

  ];

  List<Widget> screens = [
    BusinessScreen(),
    SportScreen(),
    ScinceScreen(),
  ];

  void changeBottomNavBar(int index){
    currentIndex = index;
    emit(NewsBottomNavState());
  }

  List<dynamic>? business = [];

  void getBusiness() {
    emit(NewsGetBusinessLodingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'business',
      'apiKey': '230f2f2131ac43c8ba4e4217bd50a6b7',
    }).then((value) {
      business = value.data['articles'];
      print(business![0]['title']);
      emit(NewsGetBusinessSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetBusinessErorrState(error.toString()));
    });
  }


  List<dynamic>? sport = [];

  void getSport() {
    emit(NewsGetSportLodingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'sports',
      'apiKey': '230f2f2131ac43c8ba4e4217bd50a6b7',
    }).then((value) {
      sport = value.data['articles'];
      print(sport![0]['title']);
      emit(NewsGetSportSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSportErorrState(error.toString()));
    });
  }


  List<dynamic> science = [];

  void getScience() {
    emit(NewsGetScienceLodingState());

    if (science.length == 0) {
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'science',
        'apiKey': '230f2f2131ac43c8ba4e4217bd50a6b7',
      }).then((value) {
        science = value.data['articles'];
        print(science[0]['title']);
        emit(NewsGetScienceSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetScienceErorrState(error.toString()));
      });
    } else {
      emit(NewsGetScienceSuccessState());
    }
  }

  List<dynamic> search = [];

  void getsearch(String value) {
    emit(NewsGetSearchLodingState());


    DioHelper.getData(url: 'v2/everything', query: {
      'q': '$value',
      'apiKey': '230f2f2131ac43c8ba4e4217bd50a6b7',
    }).then((value) {
      search = value.data['articles'];
      print(search[0]['title']);
      emit(NewsGetSearchSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSearchErorrState(error.toString()));
    });
  }

}