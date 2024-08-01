import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconteck_task/core/app_colors.dart';
import 'package:iconteck_task/widgets/app_text.dart';

class CardItemWidget extends StatefulWidget {
  final String title ;
  final String image ;
  final int quantity ;
  final int price ;
  final void Function()? onPressed ;
  const CardItemWidget({super.key , required this.title , required this.image ,
  required this.quantity , required this.price , required this.onPressed});

  @override
  State<CardItemWidget> createState() => _CardItemWidgetState();
}

class _CardItemWidgetState extends State<CardItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      child: Padding(
      padding: const EdgeInsets.all(20) ,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                children: [
                  appText(
                      text: widget.title,
                      color: AppColors.blackColor,
                      fontSize: 18 ,
                      fontWeight: FontWeight.bold) ,
                 SizedBox(height: 10.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: AppColors.primaryColor ,
                          ),
                          padding: const EdgeInsets.all(8),
                          child: const Icon(Icons.minimize , color: AppColors.whiteColor,
                            size: 20,),
                        ),
                      ),
                      SizedBox(width: 10.w,),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: AppColors.whiteColor ,
                            border: Border.all(color: AppColors.blackColor , width: 0.5)
                        ),
                        padding: const EdgeInsets.all(8),
                        child: appText(text: widget.quantity.toString(),
                            color: AppColors.blackColor, fontSize: 15),
                      ),
                      SizedBox(width: 10.w,),
                      InkWell(
                        onTap: () {

                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: AppColors.primaryColor ,
                          ),
                          padding: const EdgeInsets.all(8),
                          child: const Icon(Icons.add , color: AppColors.whiteColor,
                            size: 20,),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(width: 20.w,),
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Image(image: NetworkImage(widget.image),
                width: 80.w, height: 80.h,),
              ),
            ],
          ) ,
          SizedBox(height: 5.h,),
          const Divider(color: AppColors.greyColor, thickness: 1 ,
              endIndent: 20 ,
              indent: 20,),
          SizedBox(height: 5.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  appText(
                      text: "رس",
                      color: AppColors.primaryColor,
                      fontSize: 19 ,
                      fontWeight: FontWeight.bold),
                  SizedBox(width: 5.w,),
                  appText(
                      text: widget.price.toString(),
                      color: AppColors.primaryColor,
                      fontSize: 19 ,
                      fontWeight: FontWeight.bold),
                ],
              ),
              InkWell(
                  onTap: widget.onPressed,
                  child: const Icon(Icons.delete , color: AppColors.greyColor, size: 35,)),
            ],
          )
        ],
      ),),
    );
  }
}
