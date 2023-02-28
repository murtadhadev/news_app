
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_app/cubit/cubit.dart';
import 'package:news_app/shared/local/cache_helper.dart';
import 'package:news_app/shared/remote/dio_helper.dart';

import 'layout/news_app/news_layout.dart';
import 'modules/news_app/onbording/onbording_screen.dart';

void main()async{
WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  DioHelper.init();


  bool? onBording = CacheHelper.getData(key: 'onBording');
  print(onBording);
  Widget widget;

  if(onBording != null){
    widget=NesLayout();
  } else{
    widget = OnbordingScreen();
  }

  runApp(MyApp(onBording,widget));
}


class MyApp extends StatelessWidget {
 final bool? onBording;
 final Widget widget;


   MyApp(this.onBording , this.widget);


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..getBusiness()..getSport()..getScience(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: widget,
      ),
    );
  }
}






