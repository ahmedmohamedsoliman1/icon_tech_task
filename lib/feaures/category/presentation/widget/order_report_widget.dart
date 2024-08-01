import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconteck_task/core/app_colors.dart';
import 'package:iconteck_task/widgets/app_text.dart';

class OrderReportWidget extends StatefulWidget {
  final int numberOfProducts ;
  final double sum ;

  const OrderReportWidget({super.key ,required this.numberOfProducts , required this.sum});

  @override
  State<OrderReportWidget> createState() => _OrderReportWidgetState();
}

class _OrderReportWidgetState extends State<OrderReportWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.4,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: AppColors.whiteColor,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 2,
                spreadRadius: 2
            )
          ],
          borderRadius: const BorderRadius.only(topRight: Radius.circular(40),
              topLeft: Radius.circular(40))
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              appText(
                  text: "ملخض الطلب",
                  color: AppColors.primaryColor,
                  fontSize: 18 ,
                  fontWeight: FontWeight.bold)
            ],
          ),
          SizedBox(height: 5.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  appText(
                      text: "رس",
                      color: AppColors.blackColor,
                      fontSize: 19 ,
                      fontWeight: FontWeight.bold),
                  SizedBox(width: 5.w,),
                  appText(
                      text: "1.43",
                      color: AppColors.blackColor,
                      fontSize: 19 ,
                      fontWeight: FontWeight.bold),
                ],
              ),
              appText(
                  text: "ضريبة القيمة المضافة",
                  color: AppColors.blackColor,
                  fontSize: 19 ,
                  fontWeight: FontWeight.bold),
            ],
          ),
          SizedBox(height: 5.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              appText(
                  text: widget.numberOfProducts.toString(),
                  color: AppColors.blackColor,
                  fontSize: 19 ,
                  fontWeight: FontWeight.bold),
              appText(
                  text: "عدد المنتجات",
                  color: AppColors.blackColor,
                  fontSize: 19 ,
                  fontWeight: FontWeight.bold),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              appText(
                  text: widget.sum.toString(),
                  color: AppColors.primaryColor,
                  fontSize: 19 ,
                  fontWeight: FontWeight.bold),
              appText(
                  text: "الاجمالى (شامل الضريبة)",
                  color: AppColors.primaryColor,
                  fontSize: 19 ,
                  fontWeight: FontWeight.bold),
            ],
          ),
          SizedBox(height: 5.h,),
          Row(
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
          ),

        ],
      ),
    );
  }
}
