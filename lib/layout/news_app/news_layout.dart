import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_app/cubit/cubit.dart';
import 'package:news_app/layout/news_app/cubit/states.dart';

import '../../modules/news_app/search/search_screen.dart';
import '../../shared/components/components.dart';

class NesLayout extends StatelessWidget {
  const NesLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state) {},
      builder: (context,state) {
        var cubit = NewsCubit.get(context);
      return  Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              title: Text('آخر الآخبار',style: TextStyle(color: Colors.black),),
              actions: [
                IconButton(onPressed: (){
                  navigateTo(context, SearchScreen());
                }, icon: Icon(Icons.search,color: Colors.black,)),


              ],
            ),
            body: cubit.screens[cubit.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: cubit.currentIndex,
          onTap: (index){
            cubit.changeBottomNavBar(index);
          },
          items: cubit.bottomItems,
        ),
        );
      },

    );
  }
}
