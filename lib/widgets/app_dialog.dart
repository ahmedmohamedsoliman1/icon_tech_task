import 'dart:async';
import 'package:flutter/material.dart';
import 'package:iconteck_task/config/extensions/navigate_extension.dart';

class AppDialog {

 static void showAppDialog ({required Widget content , required Color backGroundColor  , required BuildContext context ,
 bool? navigate , String? nextPage}) {
   showDialog(context: context, builder: (context){
     Timer(const Duration(seconds: 2), () {
       context.pop(context);
     navigate == true ?  navigateToNextPage(nextPage! , context) : null ;
       });
     return content ;
   });
  }

  static navigateToNextPage(String pageName , BuildContext context) {
   context.pushNamed(context , pageName, null);
  }
}