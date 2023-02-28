
// https://newsapi.org/v2/everything?q==tesla&apiKey=230f2f2131ac43c8ba4e4217bd50a6b7

import 'package:dio/dio.dart';

class DioHelper
{
  static Dio? dio;

  static init()
  {
    dio = Dio(
      BaseOptions(
        baseUrl:  'https://newsapi.org/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
  required String url,
    Map<String,dynamic>? query,
})async{
     return await dio!.get(url,queryParameters: query);
  }

}