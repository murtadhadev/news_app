

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../modules/news_app/web_view/web_view_screen.dart';

Widget buildArticleItem(article, context) =>InkWell(
  onTap: (){
navigateTo(context, WebViewScreen(article['url']));
  },
  child:   Container(
    height: 150,
    width: double.infinity,
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                  image: NetworkImage('${article['urlToImage']}'),
                fit: BoxFit.cover
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Container(
              height: 120,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      '${article['title']}',
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    '${article['publishedAt']}',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ),

  ),
);


Widget articleBulder(list,context,{isSearch = false})=> ConditionalBuilder(
  condition: list.length > 0,
  builder: (context) => ListView.separated(
    physics: BouncingScrollPhysics(),
    itemBuilder: (context,index) => buildArticleItem(list[index],context),
    separatorBuilder: (context,index) => Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Container(height: 1, width: double.infinity,),
    ),
    itemCount: list.length,
  ),
  fallback: (context) =>   isSearch ? Container() : Center(child: CircularProgressIndicator(),),
);


Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  final void Function(String?)? onSubmit,
  final void Function(String?)? onChanged,
  bool isPassword = false,
  //bool isClickable = true,
  required final FormFieldValidator<String>? validate,
  required String label,
  required Icon prefix,
  void Function()? onTap,
  IconData? suffix,
  void Function()? suffixPressed,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      onFieldSubmitted: onSubmit,
      //enabled: isClickable,
      onChanged: onChanged,
      validator: validate,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        prefixIcon: prefix,
        suffixIcon: suffix != null
            ? IconButton(
            onPressed: suffixPressed,
            icon: Icon(
              suffix,
            ))
            : null,
      ),
      onTap: onTap ?? () {},
    );


void navigateTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);