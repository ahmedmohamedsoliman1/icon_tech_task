import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconteck_task/core/app_colors.dart';
import 'package:iconteck_task/core/app_strings.dart';
import 'package:iconteck_task/widgets/app_text.dart';

class InfoWindowWidget extends StatefulWidget {

  final String? title ;
  final String? phone ;
  final String? status ;
  final String? address ;
  final String? distance ;
  final String? image ;
  const InfoWindowWidget({super.key , this.address , this.phone , this.title , this.status , this.distance , this.image});

  @override
  State<InfoWindowWidget> createState() => _InfoWindowWidgetState();
}

class _InfoWindowWidgetState extends State<InfoWindowWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height*0.45,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    appText(
                        text: widget.title!,
                        color: AppColors.blackColor,
                        fontSize: 18 ,
                        fontWeight: FontWeight.w700),
                    SizedBox(height: 5.h,),
                    Row(
                      children: [
                        appText(
                          text: widget.phone!,
                          color: AppColors.greyColor,
                          fontSize: 16 ,
                          fontWeight: FontWeight.w500 ,),
                        SizedBox(width: 5.w,),
                        appText(
                          text: " : ${AppStrings.phone}",
                          color: AppColors.greyColor,
                          fontSize: 16 ,
                          fontWeight: FontWeight.w500 ,)
                      ],
                    )
                  ],
                ),
                SizedBox(width: 5.w,),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Image(image: NetworkImage(widget.image!) ,
                    width: 80.h, height: 80.h,fit: BoxFit.fill,),
                ),
              ],
            ) ,
            SizedBox(height: 15.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    appText(
                        text: AppStrings.address,
                        color: AppColors.greyColor,
                        fontSize: 16 ,
                        fontWeight: FontWeight.w700),
                    appText(
                        text: widget.address!,
                        color: AppColors.blackColor,
                        fontSize: 16 ,
                        fontWeight: FontWeight.w700),
                  ],
                ),
                SizedBox(width: 5.w,),
                const Icon(Icons.table_restaurant_rounded , color: AppColors.blackColor , size: 30,),
              ],
            ),
            SizedBox(height: 15.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    appText(
                        text: AppStrings.arriveToBranch,
                        color: AppColors.greyColor,
                        fontSize: 16 ,
                        fontWeight: FontWeight.w700),
                    Row(
                      children: [
                        appText(
                            text: "كم",
                            color: AppColors.blackColor,
                            fontSize: 16 ,
                            fontWeight: FontWeight.w700),
                        SizedBox(width: 5.w,),
                        appText(
                            text: widget.distance!,
                            color: AppColors.blackColor,
                            fontSize: 16 ,
                            fontWeight: FontWeight.w700),
                      ],
                    ),
                  ],
                ),
                SizedBox(width: 5.w,),
                const Icon(Icons.table_restaurant_rounded , color: AppColors.blackColor , size: 30,),
              ],
            ),
            SizedBox(height: 15.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.blackColor , width: 0.5),
                      color: AppColors.whiteColor ,
                      borderRadius: BorderRadius.circular(15)
                  ),
                  padding: const EdgeInsets.all(8),
                  child: appText(
                      text: widget.status!,
                      color: AppColors.blackColor,
                      fontSize: 12 ,
                      fontWeight: FontWeight.w700),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
