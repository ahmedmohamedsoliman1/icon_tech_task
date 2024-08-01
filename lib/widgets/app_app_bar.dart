import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconteck_task/config/extensions/navigate_extension.dart';

import '../core/app_colors.dart';

PreferredSizeWidget? customAppBar (String? title , BuildContext? context) {
  return AppBar(
    leading: InkWell(
        onTap: () {
         context!.pop(context);
        },
        child: const Icon(Icons.arrow_back_ios)),
    backgroundColor: AppColors.transparentColor,
    elevation: 0,
    iconTheme: const IconThemeData(
      color: AppColors.primaryColor,
    ),
    centerTitle: true,
    title: title == null ? null : Text(title , style: const TextStyle(color: AppColors.primaryColor ,
    fontSize: 22 ,fontWeight: FontWeight.bold)),
  );
}