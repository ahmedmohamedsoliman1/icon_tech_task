import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconteck_task/core/app_colors.dart';
import 'package:iconteck_task/widgets/app_text.dart';

class DetailsStackWidgetFive extends StatefulWidget {
  const DetailsStackWidgetFive({Key? key}) : super(key: key);

  @override
  State<DetailsStackWidgetFive> createState() => _DetailsStackWidgetFiveState();
}

class _DetailsStackWidgetFiveState extends State<DetailsStackWidgetFive> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(onPressed: (){

        }, child: appText(
            text:  "اضافة ملاحظة",
            color: AppColors.primaryColor,
            fontSize: 17 ,
            fontWeight: FontWeight.bold),),
        Row(
          children: [
            appText(
              text: " ملاحظات اضافية ؟ ",
              color: AppColors.blackColor,
              fontSize: 17 ,
              fontWeight: FontWeight.bold),
            SizedBox(width: 5.w,) ,
            const Icon(Icons.chat_bubble_outline_outlined) ,],
        ),
      ],
    );
  }
}
