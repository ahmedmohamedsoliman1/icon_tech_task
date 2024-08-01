import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconteck_task/core/app_colors.dart';
import 'package:iconteck_task/widgets/app_text.dart';

class DetailsStackWidgetFour extends StatefulWidget {

  final String title ;
  final int price ;
  final String calories ;
  const DetailsStackWidgetFour({super.key , required this.calories , required this.title , required this.price});

  @override
  State<DetailsStackWidgetFour> createState() => _DetailsStackWidgetFourState();
}

class _DetailsStackWidgetFourState extends State<DetailsStackWidgetFour> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            appText(
                text: widget.title,
                color: AppColors.primaryColor,
                fontSize: 20 ,
                fontWeight: FontWeight.bold)
          ],
        ),
        SizedBox(height: 5.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            appText(
                text: " سعر حرارى / قطعة",
                color: AppColors.greyColor,
                fontSize: 17 ,
                fontWeight: FontWeight.bold),
            appText(
                text: widget.calories,
                color: AppColors.greyColor,
                fontSize: 17 ,
                fontWeight: FontWeight.bold),
            SizedBox(width: 2.w,),
            const Icon(Icons.local_fire_department_outlined , color: Colors.orange, size: 30,),
          ],
        ),
        SizedBox(height: 10.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            appText(
                text: "رس",
                color: AppColors.blackColor,
                fontSize: 17 ,
                fontWeight: FontWeight.bold),
            SizedBox(width: 5.w,),
            appText(
                text: widget.price.toString(),
                color: AppColors.blackColor,
                fontSize: 17 ,
                fontWeight: FontWeight.bold),
          ],
        ),
      ],
    );
  }
}
