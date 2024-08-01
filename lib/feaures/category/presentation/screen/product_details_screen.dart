import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconteck_task/config/dependency_injection/DP.dart';
import 'package:iconteck_task/core/app_colors.dart';
import 'package:iconteck_task/core/app_strings.dart';
import 'package:iconteck_task/feaures/category/presentation/screen/category_screen_view_model.dart';
import 'package:iconteck_task/feaures/category/presentation/widget/details_stack_widget_five.dart';
import 'package:iconteck_task/feaures/category/presentation/widget/details_stack_widget_four.dart';
import 'package:iconteck_task/feaures/category/presentation/widget/details_stack_widget_one.dart';
import 'package:iconteck_task/feaures/category/presentation/widget/details_stack_widget_three.dart';
import 'package:iconteck_task/feaures/category/presentation/widget/details_stack_widget_two.dart';
import 'package:iconteck_task/widgets/app_button.dart';
import 'package:iconteck_task/widgets/app_text.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as Map ;
    return ChangeNotifierProvider(
        create: (context) => CategoryScreenViewModel(categoriesUseCase: DP.getIt()),
    child: SafeArea(
        child: Scaffold(
          body: Consumer<CategoryScreenViewModel>(
              builder: (context , provider , _) {
                return Stack(
                  children: [
                    const DetailsStackWidgetOne(),
                    const DetailsStackWidgetTwo(),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          const DetailsStackWidgetThree(),
                          Image(image: NetworkImage(args["image"]) ,
                          height: MediaQuery.of(context).size.height*0.35),
                          SizedBox(height: 20.h,),
                          DetailsStackWidgetFour(
                            title: args["title"],
                            calories: args["calories"],
                            price: args["price"],
                          ),
                          SizedBox(height: 10.h,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  provider.decreaseNumber();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: AppColors.primaryColor ,
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  child: const Icon(Icons.minimize , color: AppColors.whiteColor,
                                  size: 35,),
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
                                child: appText(text: "${provider.number}",
                                    color: AppColors.blackColor, fontSize: 25),
                              ),
                              SizedBox(width: 10.w,),
                              InkWell(
                                onTap: () {
                                  provider.increaseNumber();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: AppColors.primaryColor ,
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  child: const Icon(Icons.add , color: AppColors.whiteColor,
                                    size: 35,),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 20.h,),
                          const DetailsStackWidgetFive(),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Stack(
                                alignment: Alignment.topLeft,
                                children: [
                                  Container(
                                    height: 60.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: AppColors.primaryColor ,
                                    ),
                                    padding: const EdgeInsets.all(8),
                                    child: const Icon(Icons.shopping_basket , color: AppColors.whiteColor,
                                      size: 35,),
                                  ),
                                  Container(
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.redColor ,
                                    ),
                                    padding: const EdgeInsets.all(5),
                                    child: appText(
                                        text: provider.number.toString(),
                                        color: AppColors.whiteColor,
                                        fontSize: 17 ,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              SizedBox(width: 20.w,),
                              SizedBox(
                                height: 60.h,
                                child: customButton(() {
                                     }, context,
                                   Row(
                                     children: [
                                       Row(
                                         mainAxisAlignment: MainAxisAlignment.end,
                                         children: [
                                           appText(
                                               text: "رس",
                                               color: AppColors.whiteColor,
                                               fontSize: 17 ,
                                               fontWeight: FontWeight.bold),
                                           SizedBox(width: 5.w,),
                                           appText(
                                               text: "${args["price"] * provider.number}",
                                               color: AppColors.whiteColor,
                                               fontSize: 17 ,
                                               fontWeight: FontWeight.bold),
                                         ],
                                       ),
                                       SizedBox(width: 20.w,),
                                       appText(text: AppStrings.addToCard,
                                           color: AppColors.whiteColor, fontSize: 20 ,
                                           fontWeight: FontWeight.bold),
                                     ],
                                   )
                                    , AppColors.primaryColor),
                              ),

                            ],
                          )
                        ],
                      ),
                    )
                  ],
                );
              }),
        )),);
  }
}
